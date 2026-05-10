Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB639A808
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778423369; cv=none; b=gCKnc5hwlhq8XjID+6VdFajQIDsKrHQba97quZyqbjsm9kMIpdLxWPaPBVUpq3TcX1K6y2COxtZE1ynQNC7hPma8RucRCx0tSyfXraUjRoJX/DG18+3I/pnlDmeztXHP9e8fR25v/sfKP7EdkFdNrlNk34ft1chW6HIsY1gjHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778423369; c=relaxed/simple;
	bh=nSd50E4eLzJ8wL1X8xyn05pweLf3MY+JGZLNWFcqXFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fnm2J1Z6dvNk/Dixo0xqgD/bj/adRvFH8SWDs1t1YpnYr9vdzo65MU2UH67QhWjL9NhKDcZSmU/gP8ZSA+SixYAVmziE02CF72ttJAHPTzKEVbxBcarod/TedkaW0QgX/x4g9hjRMyPB1q9lMHYwGldkvWJRna09pUDfsb3VpMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=it0utIYs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="it0utIYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778423368; x=1809959368;
  h=date:from:to:cc:subject:message-id;
  bh=nSd50E4eLzJ8wL1X8xyn05pweLf3MY+JGZLNWFcqXFc=;
  b=it0utIYsxrjBm0cEfBEzGUJWcXTgktgaa+x2lMOvA3N13003IESlwuqi
   lLNdgLJK8IL350Dbbzgy54d/i8Gijg8yon4sk6jDEVU9AY2YUsI52q204
   ifAPrkKq48+8hEt5743SA/0ZtFWrfDXZSikNmXr59NhjXa2WFVwURWk35
   9MSfyFpFhJKYmAPgWqJTNXOQjUB8m2c4ySZPQjBvW68TthbU0xXm5iSQF
   JaT/cKLSZ+MLoTFFD66MgyJh35K9UEYMIAUiJFYlnQIi6Vn89pE5DXi9A
   hsBGatK7g7H7Mv4SMEMZP30cfsvFEPLxCIv0WyY49YEcKnsHrvUebHoop
   g==;
X-CSE-ConnectionGUID: jRanwCvKQVGhg3WgaN2B0A==
X-CSE-MsgGUID: B+2R/kUxQTaMEh5EULmg8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79315372"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79315372"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 07:29:24 -0700
X-CSE-ConnectionGUID: xcnTWO6QTDCwZganH1CXgg==
X-CSE-MsgGUID: 6JVXsxFdTYqRHicxcWJeCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="230837535"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2026 07:29:22 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM59j-000000002J1-3VGW;
	Sun, 10 May 2026 14:29:19 +0000
Date: Sun, 10 May 2026 22:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 18/19]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:986:44: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'unsigned int'
Message-ID: <202605102231.h5c0xBgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: e9ca8c87d173cbf7eb2089d7ddec9149e1d608a1 [18/19] HID: Add Apple DockChannel HID transport driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605102231.h5c0xBgU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102231.h5c0xBgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102231.h5c0xBgU-lkp@intel.com/

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

   979	
   980	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   981	{
   982		struct dchid_subhdr *shdr = (void *)data;
   983		u8 *payload = data + sizeof(*shdr);
   984	
   985		if (shdr->length + sizeof(*shdr) > hdr->length) {
 > 986			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
   987				shdr->length, hdr->length - sizeof(*shdr));
   988			return;
   989		}
   990		if (shdr->flags != iface->out_flags) {
   991			dev_err(iface->dchid->dev,
   992				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   993				shdr->flags, iface->out_flags);
   994			return;
   995		}
   996	
   997		if (shdr->length < 1) {
   998			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   999			return;
  1000		}
  1001		if (iface->tx_seq != hdr->seq) {
  1002			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
  1003				iface->tx_seq, hdr->seq);
  1004			return;
  1005		}
  1006		if (iface->out_report != payload[0]) {
  1007			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
  1008				iface->out_report, payload[0]);
  1009			return;
  1010		}
  1011	
  1012		if (iface->resp_buf && iface->resp_size)
  1013			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1014	
  1015		iface->resp_size = shdr->length;
  1016		iface->out_report = -1;
  1017		iface->retcode = shdr->retcode;
  1018		complete(&iface->out_complete);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
