Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA891C26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 03:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690514341; x=1722050341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0kWdZVLwSOkcmKQwJ1UuC9uCkhY2mlOjGdwxLHDCMY=;
  b=CniP0Nq6G9gcSqp2N4w1MMzznrJptXOvFu/OoEShihDSnBJA2NJebjrd
   uaPu/DGOeafAuqYXwVTm1zKF0GKie/0hMZ+SgbLzcA0d6yTLAXFPORrTH
   MHhMzYm+YXdG0lT8GBWJy9LzCcbqIz/lmbbqfmxZNrbTpweml1zwhwlyb
   n/VFy32wGPjEnqBxwAj9OjH00eczmiobSqWF+J4EcGH34B9u3fvZJyAMT
   2BSo3oXtA6/46dootzJn5/OsZrVhSc/RAYsOMRhpOitnt/FRe2B3vuS/3
   psbrblXrXVh3vwPJaQsnSgoyQwqSaYpbIctEDHi06M4Dez+k1/aWIM+Xw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434780598"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="434780598"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 20:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704369131"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="704369131"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 20:18:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPE0G-0002pn-1u;
	Fri, 28 Jul 2023 03:18:56 +0000
Date: Fri, 28 Jul 2023 11:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/21]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:973:44: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'unsigned int'
Message-ID: <202307281156.W9u6ge3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   58700c861f0a37630478bf31ded5eaf81e50b1a2
commit: 20143b87e3745940ddaa384b5e1112be1ef9df0b [15/21] hid: Add Apple DockChannel HID transport driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230728/202307281156.W9u6ge3b-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281156.W9u6ge3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281156.W9u6ge3b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dchid_handle_ack':
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:973:44: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     973 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:973:17: note: in expansion of macro 'dev_err'
     973 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                 ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:973:75: note: format string is defined here
     973 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~^
         |                                                                           |
         |                                                                           long int
         |                                                                         %d


vim +973 drivers/hid/dockchannel-hid/dockchannel-hid.c

   966	
   967	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   968	{
   969		struct dchid_subhdr *shdr = (void *)data;
   970		u8 *payload = data + sizeof(*shdr);
   971	
   972		if (shdr->length + sizeof(*shdr) > hdr->length) {
 > 973			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
   974				shdr->length, hdr->length - sizeof(*shdr));
   975			return;
   976		}
   977		if (shdr->flags != iface->out_flags) {
   978			dev_err(iface->dchid->dev,
   979				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   980				shdr->flags, iface->out_flags);
   981			return;
   982		}
   983	
   984		if (shdr->length < 1) {
   985			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   986			return;
   987		}
   988		if (iface->tx_seq != hdr->seq) {
   989			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
   990				iface->tx_seq, hdr->seq);
   991			return;
   992		}
   993		if (iface->out_report != payload[0]) {
   994			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
   995				iface->out_report, payload[0]);
   996			return;
   997		}
   998	
   999		if (iface->resp_buf && iface->resp_size)
  1000			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1001	
  1002		iface->resp_size = shdr->length;
  1003		iface->out_report = -1;
  1004		iface->retcode = shdr->retcode;
  1005		complete(&iface->out_complete);
  1006	}
  1007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
