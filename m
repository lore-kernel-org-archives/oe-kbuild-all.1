Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79B4F897
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcoZN6Xt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701977453; x=1733513453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ni9LHcDFxpSKk37CXMF+oPjVX8r7ExfZ+aG86iqZo6w=;
  b=LcoZN6Xtu5fFAN+PqezwNe27P7HiZtPvzXNm8zJ3sLDpV03K4dczVodp
   byH//DLRpbqm0dNJdCKnS7YLuXskzKlrks3Na1Ug80ekEx+2U4NusNwL7
   KV9rY0qwFtNc0ORAjy8RGlbvTfFqNW9RpksdLTBxzaCEu54zHAPokNJ3Z
   GSeaM6KgJoJxF5UuYZAnSQfjprBdZJ9R/l4nfVX3FbXZQ9foH7zQ4Ujkw
   kWm7FIDPdI4+ySjBKMXZ9gP15VlxfXjrcZPwcH25v/nHsUsp3ypAZkxLH
   hohjCoXmUKpRK1RtEN5lZ71ircA2MP/j4PlgnFIwZElLd5kaiX+CcsKLm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393161440"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="393161440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806132943"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="806132943"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2023 11:30:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBK54-000Cjh-2E;
	Thu, 07 Dec 2023 19:30:42 +0000
Date: Fri, 8 Dec 2023 03:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: drivers/comedi/drivers/ni_daq_700.c:163:17: sparse: sparse: cast to
 restricted __le16
Message-ID: <202312080308.IqKTXDYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 30b5e6ef4a32ea4985b99200e06d6660a69f9246 m68k: atari: Make Atari ROM port I/O write macros return void
date:   1 year, 7 months ago
config: m68k-randconfig-r131-20231119 (https://download.01.org/0day-ci/archive/20231208/202312080308.IqKTXDYM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080308.IqKTXDYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080308.IqKTXDYM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/comedi/drivers/ni_daq_700.c:163:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_daq_700.c:163:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_daq_700.c:163:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_daq_700.c:163:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:173:21: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:173:21: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:173:21: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:173:21: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:205:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:205:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:205:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_daq_700.c:205:9: sparse: sparse: cast to restricted __le16

vim +163 drivers/comedi/drivers/ni_daq_700.c

a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  129  
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  130  static int daq700_ai_rinsn(struct comedi_device *dev,
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  131  			   struct comedi_subdevice *s,
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  132  			   struct comedi_insn *insn, unsigned int *data)
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  133  {
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  134  	int n;
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  135  	int d;
a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  136  	int ret;
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  137  	unsigned int chan	= CR_CHAN(insn->chanspec);
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  138  	unsigned int aref	= CR_AREF(insn->chanspec);
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  139  	unsigned int range	= CR_RANGE(insn->chanspec);
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  140  	unsigned int r3_bits	= 0;
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  141  
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  142  	/* set channel input modes */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  143  	if (aref == AREF_DIFF)
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  144  		r3_bits |= CMD_R3_DIFF;
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  145  	/* write channel mode/range */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  146  	if (range >= 1)
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  147  		range++;        /* convert range to hardware value */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  148  	outb(r3_bits | (range & 0x03), dev->iobase + CMD_R3);
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  149  
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  150  	/* write channel to multiplexer */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  151  	/* set mask scan bit high to disable scanning */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  152  	outb(chan | 0x80, dev->iobase + CMD_R1);
ffed54dced8672 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2014-05-19  153  	/* mux needs 2us to really settle [Fred Brooks]. */
ffed54dced8672 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2014-05-19  154  	udelay(2);
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  155  
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  156  	/* convert n samples */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  157  	for (n = 0; n < insn->n; n++) {
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  158  		/* trigger conversion with out0 L to H */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  159  		outb(0x00, dev->iobase + CMD_R2); /* enable ADC conversions */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  160  		outb(0x30, dev->iobase + CMO_R); /* mode 0 out0 L, from H */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  161  		outb(0x00, dev->iobase + ADCLEAR_R);	/* clear the ADC FIFO */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20  162  		/* read 16bit junk from FIFO to clear */
cf695df834efc7 drivers/staging/comedi/drivers/ni_daq_700.c Fred Brooks       2014-06-20 @163  		inw(dev->iobase + ADFIFO_R);
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  164  		/* mode 1 out0 H, L to H, start conversion */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  165  		outb(0x32, dev->iobase + CMO_R);
a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  166  
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  167  		/* wait for conversion to end */
a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  168  		ret = comedi_timeout(dev, s, insn, daq700_ai_eoc, 0);
22ca19d93d92c7 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  169  		if (ret)
a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  170  			return ret;
a9f9d831454114 drivers/staging/comedi/drivers/ni_daq_700.c H Hartley Sweeten 2014-02-10  171  
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  172  		/* read data */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  173  		d = inw(dev->iobase + ADFIFO_R);
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  174  		/* mangle the data as necessary */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  175  		/* Bipolar Offset Binary: 0 to 4095 for -10 to +10 */
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  176  		d &= 0x0fff;
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  177  		d ^= 0x0800;
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  178  		data[n] = d;
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  179  	}
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  180  	return n;
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  181  }
198b0fa48b25b6 drivers/staging/comedi/drivers/ni_daq_700.c Ian Abbott        2012-09-21  182  

:::::: The code at line 163 was first introduced by commit
:::::: cf695df834efc718b2ed17e9c83e127fd63c9033 staging: comedi: ni_daq_700: add AI range and input mode switching

:::::: TO: Fred Brooks <frederick.brooks@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
