Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF96DDBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691488617; x=1723024617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2c95+jRgme7/H0hu7KakEtIlxw2Wv1yVDKVuWXjUZ8=;
  b=d3ToFpsbfu8nShn6bIkaZ9i1adANG2k4Xsb8CBx+WWVCkykMJeLJDoXp
   xOnhpCG+OQDyNaKCg+EHSMqQ+zcKNpXrH2HpFbukkIbsXYHc/xDWndxn8
   x3Qa8FkSTpj6THqs4bz7pAw9f9w4dvMU7wsUS3vDCFBONtd1KyC8uW3Xy
   JHt7E0PxW8yuhfpr+GzAYhImNLK6uXWy1Q/wAYFd9ZnudWmJmqF+XrLEv
   bW5am2HHzePKfSNlc9kTlKMUz1Us2gxXKjpfqabDYDmKw7ZdpisUJ1vHZ
   z7JbHfsBUSSdxp8MetHuQtNeqJX+gbc+jyM0BmlPVoftm/S05LxxG+AH3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350367962"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="350367962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 02:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845407459"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="845407459"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 02:56:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTJSQ-0005HM-2R;
	Tue, 08 Aug 2023 09:56:54 +0000
Date: Tue, 8 Aug 2023 17:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 36/88] drivers/net/usb/hso.c:1341:20: sparse:
 sparse: incompatible types in comparison expression (different type sizes):
Message-ID: <202308081720.Ht5dTaHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   9cb2aea97112feef27c44bd320b1dca759f0cc35
commit: 45fb3133bf54630be3396bc0ecb38e01163923df [36/88] tty: hso: convert to unsigned and use min()
config: x86_64-randconfig-x061-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081720.Ht5dTaHi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081720.Ht5dTaHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081720.Ht5dTaHi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/usb/hso.c:1484:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1485:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1486:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1494:37: sparse: sparse: cast to restricted __le16
>> drivers/net/usb/hso.c:1341:20: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/net/usb/hso.c:1341:20: sparse:    unsigned long *
>> drivers/net/usb/hso.c:1341:20: sparse:    unsigned int *
   drivers/net/usb/hso.c:1638:37: sparse: sparse: cast to restricted __le16

vim +1341 drivers/net/usb/hso.c

  1323	
  1324	/* close the requested serial port */
  1325	static ssize_t hso_serial_write(struct tty_struct *tty, const u8 *buf,
  1326					size_t count)
  1327	{
  1328		struct hso_serial *serial = tty->driver_data;
  1329		unsigned long flags;
  1330		unsigned int space, tx_bytes;
  1331	
  1332		/* sanity check */
  1333		if (serial == NULL) {
  1334			pr_err("%s: serial is NULL\n", __func__);
  1335			return -ENODEV;
  1336		}
  1337	
  1338		spin_lock_irqsave(&serial->serial_lock, flags);
  1339	
  1340		space = serial->tx_data_length - serial->tx_buffer_count;
> 1341		tx_bytes = min(count, space);
  1342	
  1343		if (!tx_bytes)
  1344			goto out;
  1345	
  1346		memcpy(serial->tx_buffer + serial->tx_buffer_count, buf, tx_bytes);
  1347		serial->tx_buffer_count += tx_bytes;
  1348	
  1349	out:
  1350		spin_unlock_irqrestore(&serial->serial_lock, flags);
  1351	
  1352		hso_kick_transmit(serial);
  1353		/* done */
  1354		return tx_bytes;
  1355	}
  1356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
