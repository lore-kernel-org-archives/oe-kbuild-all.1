Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3D1BD4F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731946317; cv=none; b=ltU/LGfcCdjCjR3UkPGJqXDV7WIjsi59+imSSabXu8SE6iRKmMPnRRMRSmhBKGnCkfaR0EiNM+Btj/JbamtwQ0oC17skL7Ik/fYHYGlWzAQo6CRVvvwzLg/bjM8K2DrCym9uqJ4WBG9l0hmQ+cDva4JWeQzX8d69tGDNA5gC7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731946317; c=relaxed/simple;
	bh=jgWzxwpYJQ+4GjT0KzcaTJML1aCBcOd8550r1DAkQxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/4Exlv5/1uA0dKua+9W8mtSNXQDc3TftB2jKs7FKlnwLJSp1irdXZmIqTaUnb+DF5fvHwvx2qyuw48CC2eM6yxmpSSHw5lE7N1PaI8KSJzaKZIZDl3c/fq16QKEGp4E7kxuwCKf3aEPPqdAv3PuPVHd4ZcTU2gXdTXNX7Gvtl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOeJfxxl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOeJfxxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731946316; x=1763482316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jgWzxwpYJQ+4GjT0KzcaTJML1aCBcOd8550r1DAkQxE=;
  b=SOeJfxxltfoxkQlRhTX13UFZ444cVE6G76nk1i2m3q6vHyEPMpBripeC
   Y2SOtRrL0kMMfiXORCpSNYAydWVUsFMfj7R5hqmngkbEyi1ycjbLdtqRJ
   cgdyhDT1ffOsK7EfsHuhTq3MHISk3kF0apDKdOSVp1HMNPH8tSGmszlYw
   OouX6rW8rSt9A3b7sIdvT9w74Zk76MJoZH+caC9jv7nRZAptdRw/GeAnI
   eR143gSmIFCvxkWGWuZ3nZs/WcR7Bx4c+9TkAffrg2hfAIZvau22NQAhZ
   OYE+IntUKH9kt8Ky+ggY8y6Wx0NAN0bnFzJQAopOxQZJFh5uE2FsuDOXY
   Q==;
X-CSE-ConnectionGUID: GtRLD+YGSwKv3wNdHXrakg==
X-CSE-MsgGUID: BjazaqkCQCOynCNiJ+vjVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31835000"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31835000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 08:11:55 -0800
X-CSE-ConnectionGUID: DK90cC1cQyWDnZw2Y99wkQ==
X-CSE-MsgGUID: T3EBEFKrTBaX6CdTdi+NQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="120211256"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 08:11:54 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD4Lw-0002VZ-0G;
	Mon, 18 Nov 2024 16:11:52 +0000
Date: Tue, 19 Nov 2024 00:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 28/28]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:986:44: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'unsigned int'
Message-ID: <202411190001.61jZPc0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: 501868c5f377ff4155041d111e0bea3c499b97a8 [28/28] fixup! hid: Add Apple DockChannel HID transport driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411190001.61jZPc0K-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190001.61jZPc0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190001.61jZPc0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/hid/dockchannel-hid/dockchannel-hid.c:10:
   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dchid_handle_ack':
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:986:44: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:986:17: note: in expansion of macro 'dev_err'
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                 ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:986:75: note: format string is defined here
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~^
         |                                                                           |
         |                                                                           long int
         |                                                                         %d


vim +986 drivers/hid/dockchannel-hid/dockchannel-hid.c

c11b68c3111573 Hector Martin 2022-07-08   979  
c11b68c3111573 Hector Martin 2022-07-08   980  static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
c11b68c3111573 Hector Martin 2022-07-08   981  {
c11b68c3111573 Hector Martin 2022-07-08   982  	struct dchid_subhdr *shdr = (void *)data;
c11b68c3111573 Hector Martin 2022-07-08   983  	u8 *payload = data + sizeof(*shdr);
c11b68c3111573 Hector Martin 2022-07-08   984  
c11b68c3111573 Hector Martin 2022-07-08   985  	if (shdr->length + sizeof(*shdr) > hdr->length) {
c11b68c3111573 Hector Martin 2022-07-08  @986  		dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
c11b68c3111573 Hector Martin 2022-07-08   987  			shdr->length, hdr->length - sizeof(*shdr));
c11b68c3111573 Hector Martin 2022-07-08   988  		return;
c11b68c3111573 Hector Martin 2022-07-08   989  	}
c11b68c3111573 Hector Martin 2022-07-08   990  	if (shdr->flags != iface->out_flags) {
c11b68c3111573 Hector Martin 2022-07-08   991  		dev_err(iface->dchid->dev,
c11b68c3111573 Hector Martin 2022-07-08   992  			"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
c11b68c3111573 Hector Martin 2022-07-08   993  			shdr->flags, iface->out_flags);
c11b68c3111573 Hector Martin 2022-07-08   994  		return;
c11b68c3111573 Hector Martin 2022-07-08   995  	}
c11b68c3111573 Hector Martin 2022-07-08   996  
c11b68c3111573 Hector Martin 2022-07-08   997  	if (shdr->length < 1) {
c11b68c3111573 Hector Martin 2022-07-08   998  		dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
c11b68c3111573 Hector Martin 2022-07-08   999  		return;
c11b68c3111573 Hector Martin 2022-07-08  1000  	}
c11b68c3111573 Hector Martin 2022-07-08  1001  	if (iface->tx_seq != hdr->seq) {
c11b68c3111573 Hector Martin 2022-07-08  1002  		dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
c11b68c3111573 Hector Martin 2022-07-08  1003  			iface->tx_seq, hdr->seq);
c11b68c3111573 Hector Martin 2022-07-08  1004  		return;
c11b68c3111573 Hector Martin 2022-07-08  1005  	}
c11b68c3111573 Hector Martin 2022-07-08  1006  	if (iface->out_report != payload[0]) {
c11b68c3111573 Hector Martin 2022-07-08  1007  		dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
c11b68c3111573 Hector Martin 2022-07-08  1008  			iface->out_report, payload[0]);
c11b68c3111573 Hector Martin 2022-07-08  1009  		return;
c11b68c3111573 Hector Martin 2022-07-08  1010  	}
c11b68c3111573 Hector Martin 2022-07-08  1011  
c11b68c3111573 Hector Martin 2022-07-08  1012  	if (iface->resp_buf && iface->resp_size)
c11b68c3111573 Hector Martin 2022-07-08  1013  		memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
c11b68c3111573 Hector Martin 2022-07-08  1014  
c11b68c3111573 Hector Martin 2022-07-08  1015  	iface->resp_size = shdr->length;
c11b68c3111573 Hector Martin 2022-07-08  1016  	iface->out_report = -1;
c11b68c3111573 Hector Martin 2022-07-08  1017  	iface->retcode = shdr->retcode;
c11b68c3111573 Hector Martin 2022-07-08  1018  	complete(&iface->out_complete);
c11b68c3111573 Hector Martin 2022-07-08  1019  }
c11b68c3111573 Hector Martin 2022-07-08  1020  

:::::: The code at line 986 was first introduced by commit
:::::: c11b68c31115734ab97565fb48c065ea5fd2d1bf hid: Add Apple DockChannel HID transport driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
