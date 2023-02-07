Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2620D20E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675760097; x=1707296097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6a5pa/D0NOAyxHuQ4iD8jrOuFwfCLMKnXy+PU/hoIPA=;
  b=dZJ02zEAQX2leIT6mF9WUdTyc3yvjUwuNtU28xiL+TwDEG6NGW6uDwGR
   VK3UuCaQwosOJt8ujkS/bjnVw47zfeb7bNk4bcj7bCLwa6QWv0UIC7Yce
   UoVouH3ckf4kw2ERXnSzHM9pCEwQX7p/0P7buouaNfplqZ2RbIGh7MPjr
   7n+rUgDbpQrJBn5sDKVWp2qcpvs/w9kyoLEGgghDVzPNXBVxrO9XxKwUP
   gQyt7i1n7d/pbdCqz7GNtT4do1djYZjdLk4YOu1bvz4cofNUKYu8nuhiv
   QIzM9ztMxMEQ4nzw2jaNNH9tpijCKLb9kaB7xBjIV0T2jHm8FlCvZz7NY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391852415"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="391852415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 00:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="660167062"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="660167062"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2023 00:54:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPJkZ-0003NO-2P;
	Tue, 07 Feb 2023 08:54:51 +0000
Date: Tue, 7 Feb 2023 16:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	David Girault <david.girault@qorvo.com>
Subject: [sschmidt-wpan-next:master 8/14] net/mac802154/scan.c:368
 mac802154_beacon_worker() warn: always true condition
 '(local->beacon_interval >= 0) => (0-u32max >= 0)'
Message-ID: <202302071633.Yb8iZgYb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.git master
head:   6130543654e0e5a79485ed8538c0bf2259fe7431
commit: 3accf4762734a69ebd03cba989249c78ac7dfc7e [8/14] mac802154: Handle basic beaconing
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071633.Yb8iZgYb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
net/mac802154/scan.c:368 mac802154_beacon_worker() warn: always true condition '(local->beacon_interval >= 0) => (0-u32max >= 0)'

vim +368 net/mac802154/scan.c

   331	
   332	void mac802154_beacon_worker(struct work_struct *work)
   333	{
   334		struct ieee802154_local *local =
   335			container_of(work, struct ieee802154_local, beacon_work.work);
   336		struct cfg802154_beacon_request *beacon_req;
   337		struct ieee802154_sub_if_data *sdata;
   338		struct wpan_dev *wpan_dev;
   339		int ret;
   340	
   341		rcu_read_lock();
   342		beacon_req = rcu_dereference(local->beacon_req);
   343		if (unlikely(!beacon_req)) {
   344			rcu_read_unlock();
   345			return;
   346		}
   347	
   348		sdata = IEEE802154_WPAN_DEV_TO_SUB_IF(beacon_req->wpan_dev);
   349	
   350		/* Wait an arbitrary amount of time in case we cannot use the device */
   351		if (local->suspended || !ieee802154_sdata_running(sdata)) {
   352			rcu_read_unlock();
   353			queue_delayed_work(local->mac_wq, &local->beacon_work,
   354					   msecs_to_jiffies(1000));
   355			return;
   356		}
   357	
   358		wpan_dev = beacon_req->wpan_dev;
   359	
   360		rcu_read_unlock();
   361	
   362		dev_dbg(&sdata->dev->dev, "Sending beacon\n");
   363		ret = mac802154_transmit_beacon(local, wpan_dev);
   364		if (ret)
   365			dev_err(&sdata->dev->dev,
   366				"Beacon could not be transmitted (%d)\n", ret);
   367	
 > 368		if (local->beacon_interval >= 0)
   369			queue_delayed_work(local->mac_wq, &local->beacon_work,
   370					   local->beacon_interval);
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
