Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F2F1FDE39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765614560; cv=none; b=KrDnefCo93LJU073DB03PH07cd5vugABOrHYoUuqajQ30ZiratiSuvN59vUkdlGNBxTLeYSrp+X5YMNJBvl6ge0HsLDTbZAhHlyeiuUeatPrr9BE6jloZffdDy7eN2rvA31E/gWYm37wI8xq4XIdXBdamlpQDlJqkfTZf9tkJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765614560; c=relaxed/simple;
	bh=Taf5oEVDt3YjJoiwZOvh7V+eG7BtLgR954rp/PT5sVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPCtpS/ZjHMz6htQzZx5v1bHKK0Ms98aShUNaDruM5JXtet57VDaNxUsgJCK8Pyd7+veOsKiRMrtGooEiz3P28HH5FGFU+6CbsDBbSbSQqLf0WPaAmu4cz5KzBL+b9IeM4T/5d8+kA1KOzbsW1tH5d8GE4lOJnks7ECcZOywuEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6Km7/W2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6Km7/W2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765614559; x=1797150559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Taf5oEVDt3YjJoiwZOvh7V+eG7BtLgR954rp/PT5sVI=;
  b=n6Km7/W2gDYbqzsdKa2+eChD3qD2iDVNwfUH9GyhY5LuYC5FTq1yjTh3
   JEyYLXTdJ7NLMQL06ttcOFL7ouoe+HumrEOtm5+pZGhl65+tHaEXxWehi
   X1Au1eVumvtWxxYvDGJRq7RaEGKnftYGJWAuN5m6w2NJD8nWgu1lyS8fi
   hH5fpejRvNkpmZ9lQr7BU3z5Kvvbtk8Xaln5Dk2rnOW4i0BOGQ+PqYXsI
   gWtWb+kTmvleQ26f1t7ZirUv+1iTcmLOnc7zMjw4UjjnbDGNM4SEmXPui
   7EQDWkPxYTa7l/dhe+5TcfQOicW2kJnSMZvbjqpZwRC3VbC+qEUVFw/RN
   w==;
X-CSE-ConnectionGUID: /1yJCGFnTGih3Pa5s97U2g==
X-CSE-MsgGUID: Nxt9Jr6cSz+bkSunwXEJvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71232908"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71232908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:29:19 -0800
X-CSE-ConnectionGUID: y4XAtO4MRvGMVzVJDQkb/w==
X-CSE-MsgGUID: 4T8cs02PT2OHXQSrm/jg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197177982"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 00:29:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUL06-000000007Jl-4Bw0;
	Sat, 13 Dec 2025 08:29:15 +0000
Date: Sat, 13 Dec 2025 16:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] drivers/hid/hid-steam.c:1154:7:
 warning: variable 'connected' set but not used
Message-ID: <202512131626.ScDIN2jG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: e1147961b2145fa61c3078a4a797d9576cde91ab [2/2] HID: hid-steam: Move hidraw input (un)registering to work
config: i386-buildonly-randconfig-005-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131626.ScDIN2jG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131626.ScDIN2jG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131626.ScDIN2jG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-steam.c:1154:7: warning: variable 'connected' set but not used [-Wunused-but-set-variable]
    1154 |         bool connected;
         |              ^
   1 warning generated.


vim +/connected +1154 drivers/hid/hid-steam.c

c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  1148  
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  1149  static void steam_client_ll_close(struct hid_device *hdev)
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  1150  {
4bff980f920693 Rodrigo Rivas Costa 2018-05-22  1151  	struct steam_device *steam = hdev->driver_data;
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  1152  
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15  1153  	unsigned long flags;
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15 @1154  	bool connected;
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15  1155  
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15  1156  	spin_lock_irqsave(&steam->lock, flags);
9544708c64bc2c Vicki Pfau          2023-12-19  1157  	steam->client_opened = false;
9544708c64bc2c Vicki Pfau          2023-12-19  1158  	connected = steam->connected && !steam->client_opened;
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15  1159  	spin_unlock_irqrestore(&steam->lock, flags);
6b538cc21334b8 Rodrigo Rivas Costa 2019-03-15  1160  
e1147961b2145f Vicki Pfau          2025-02-04  1161  	schedule_work(&steam->unregister_work);
9544708c64bc2c Vicki Pfau          2023-12-19  1162  }
c164d6abf3841f Rodrigo Rivas Costa 2018-04-16  1163  

:::::: The code at line 1154 was first introduced by commit
:::::: 6b538cc21334b83f09b25dec4aa2d2726bf07ed0 HID: steam: fix deadlock with input devices.

:::::: TO: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
