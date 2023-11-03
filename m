Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60ACA51
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK8geDWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699004055; x=1730540055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBnknzty40mPXtXMc/X9Vtl4iZcOe5hEnLOsjcYANI0=;
  b=ZK8geDWB3HldGyr15HiUL1I0KqsZslgBI7OfsPq0VIujliCUtEbfZVTy
   hw545qF/a+WJJ/dUU2Dg9MmqMLUVzZwfeh21+hJ+NSTyygD8Xyaz3griA
   4WsXTah5Gqeg86RDA3W//jNkHmC8NSUdps7ZhfWDZxnVt4nnV0TlGc+UF
   C7vkW5D5SmgeQfgo66pMXIrO3EbJc7EVV6PZWpt7Gq8WE9U39Kb+Qw1yh
   I5t4OkUCQCgb52iFgBYisNEQGnZBiAnGVnuiS+W5nYqCH8CDGI6iDolUL
   bUg1awec4LJK83Mgkay9vZ0+f5l0TGoJQ4XKncsJdWdJr+yvU/0mjaZ5Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368260156"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368260156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827430381"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827430381"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 02:34:11 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqZ7-0002Pw-2q;
	Fri, 03 Nov 2023 09:34:09 +0000
Date: Fri, 3 Nov 2023 17:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/21]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:988:44: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'unsigned int'
Message-ID: <202311031748.nB2pm2kS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   aefaf432ff80e54092c35dcba09404239f181de6
commit: af53f3ff74f442fae36262bda9be6a94ad52925e [15/21] hid: Add Apple DockChannel HID transport driver
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311031748.nB2pm2kS-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031748.nB2pm2kS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031748.nB2pm2kS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dchid_handle_ack':
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:988:44: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     988 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:988:17: note: in expansion of macro 'dev_err'
     988 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                 ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:988:75: note: format string is defined here
     988 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~^
         |                                                                           |
         |                                                                           long int
         |                                                                         %d


vim +988 drivers/hid/dockchannel-hid/dockchannel-hid.c

   981	
   982	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   983	{
   984		struct dchid_subhdr *shdr = (void *)data;
   985		u8 *payload = data + sizeof(*shdr);
   986	
   987		if (shdr->length + sizeof(*shdr) > hdr->length) {
 > 988			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
   989				shdr->length, hdr->length - sizeof(*shdr));
   990			return;
   991		}
   992		if (shdr->flags != iface->out_flags) {
   993			dev_err(iface->dchid->dev,
   994				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   995				shdr->flags, iface->out_flags);
   996			return;
   997		}
   998	
   999		if (shdr->length < 1) {
  1000			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
  1001			return;
  1002		}
  1003		if (iface->tx_seq != hdr->seq) {
  1004			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
  1005				iface->tx_seq, hdr->seq);
  1006			return;
  1007		}
  1008		if (iface->out_report != payload[0]) {
  1009			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
  1010				iface->out_report, payload[0]);
  1011			return;
  1012		}
  1013	
  1014		if (iface->resp_buf && iface->resp_size)
  1015			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1016	
  1017		iface->resp_size = shdr->length;
  1018		iface->out_report = -1;
  1019		iface->retcode = shdr->retcode;
  1020		complete(&iface->out_complete);
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
