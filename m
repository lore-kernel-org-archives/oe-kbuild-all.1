Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B025140
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690307053; x=1721843053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A03StRVXilp7FUy7p1FkizarmFwfKvHH8dkLImp+wMo=;
  b=Uvbri6oxmIUyPrvf9XqmYDlXtNFBQ0bn0cLSw6nPYB1AUpBu5Ojb/L0p
   6RfXtzbWIFwtCqbI81CBYCkU1MiJayhGobtA17ajL1sIkyX2hn1i4l+RQ
   eIxALpioxeR7SI5KJT7Qpoz5osf3Orprf3oiJcaBqNJojt7BfUrCx7/Xw
   cljPV9bH1AuXJRAHb5SQdUiV6Jn/cpzYWZAvfXryM5YM3IX/hD9tprdV0
   TSwhDzcPpQVAh0wkQadv+F/JTCIs+gTo/n/TmMIqbO42R8ciciK2/8tKf
   Z2tYcqfO0CkP5PlbhDVcMHoEbZm/t/Oc23pRBjYtHLuF6cNtqbnhw7OKh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398718906"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="398718906"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 10:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791480063"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791480063"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 10:44:01 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOM3H-0000CB-1c;
	Tue, 25 Jul 2023 17:43:28 +0000
Date: Wed, 26 Jul 2023 01:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Mueller <dmueller@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [stable:linux-4.14.y 3076/9999]
 drivers/media/usb/dvb-usb/a800.c:96:46: warning: suggest braces around empty
 body in an 'if' statement
Message-ID: <202307260124.zXdKmrcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3076/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: openrisc-randconfig-r001-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260124.zXdKmrcc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260124.zXdKmrcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260124.zXdKmrcc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/input.h:22,
                    from drivers/media/usb/dvb-usb/dvb-usb.h:14,
                    from drivers/media/usb/dvb-usb/dibusb.h:17,
                    from drivers/media/usb/dvb-usb/a800.c:16:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/media/usb/dvb-usb/a800.c: In function 'a800_rc_query':
>> drivers/media/usb/dvb-usb/a800.c:96:46: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      96 |                 deb_rc("key: %*ph\n", 5, key);
         |                                              ^


vim +/if +96 drivers/media/usb/dvb-usb/a800.c

776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23  @16  #include "dibusb.h"
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   17  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   18  static int debug;
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   19  module_param(debug, int, 0644);
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   20  MODULE_PARM_DESC(debug, "set debugging level (rc=1 (or-able))." DVB_USB_DEBUG_STATUS);
78e92006f410a40 drivers/media/dvb/dvb-usb/a800.c Janne Grunau          2008-04-09   21  
78e92006f410a40 drivers/media/dvb/dvb-usb/a800.c Janne Grunau          2008-04-09   22  DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
78e92006f410a40 drivers/media/dvb/dvb-usb/a800.c Janne Grunau          2008-04-09   23  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   24  #define deb_rc(args...)   dprintk(debug,0x01,args)
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   25  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   26  static int a800_power_ctrl(struct dvb_usb_device *d, int onoff)
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   27  {
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   28  	/* do nothing for the AVerMedia */
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   29  	return 0;
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   30  }
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   31  
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   32  /* assure to put cold to 0 for iManufacturer == 1 */
4d43e13f723e127 drivers/media/dvb/dvb-usb/a800.c Patrick Boettcher     2006-09-30   33  static int a800_identify_state(struct usb_device *udev, struct dvb_usb_device_properties *props,
4d43e13f723e127 drivers/media/dvb/dvb-usb/a800.c Patrick Boettcher     2006-09-30   34  	struct dvb_usb_device_description **desc, int *cold)
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   35  {
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   36  	*cold = udev->descriptor.iManufacturer != 1;
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   37  	return 0;
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   38  }
a2c00a0eee751e2 drivers/media/dvb/dvb-usb/a800.c Klaus Frahm           2006-07-29   39  
2f4f58d689dd71d drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2010-11-17   40  static struct rc_map_table rc_map_a800_table[] = {
898a83e9243e239 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2011-01-24   41  	{ 0x0201, KEY_MODE },      /* SOURCE */
898a83e9243e239 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2011-01-24   42  	{ 0x0200, KEY_POWER2 },      /* POWER */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   43  	{ 0x0205, KEY_1 },           /* 1 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   44  	{ 0x0206, KEY_2 },           /* 2 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   45  	{ 0x0207, KEY_3 },           /* 3 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   46  	{ 0x0209, KEY_4 },           /* 4 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   47  	{ 0x020a, KEY_5 },           /* 5 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   48  	{ 0x020b, KEY_6 },           /* 6 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   49  	{ 0x020d, KEY_7 },           /* 7 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   50  	{ 0x020e, KEY_8 },           /* 8 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   51  	{ 0x020f, KEY_9 },           /* 9 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   52  	{ 0x0212, KEY_LEFT },        /* L / DISPLAY */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   53  	{ 0x0211, KEY_0 },           /* 0 */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   54  	{ 0x0213, KEY_RIGHT },       /* R / CH RTN */
898a83e9243e239 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2011-01-24   55  	{ 0x0217, KEY_CAMERA },      /* SNAP SHOT */
898a83e9243e239 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2011-01-24   56  	{ 0x0210, KEY_LAST },        /* 16-CH PREV */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   57  	{ 0x021e, KEY_VOLUMEDOWN },  /* VOL DOWN */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   58  	{ 0x020c, KEY_ZOOM },        /* FULL SCREEN */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   59  	{ 0x021f, KEY_VOLUMEUP },    /* VOL UP */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   60  	{ 0x0214, KEY_MUTE },        /* MUTE */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   61  	{ 0x0208, KEY_AUDIO },       /* AUDIO */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   62  	{ 0x0219, KEY_RECORD },      /* RECORD */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   63  	{ 0x0218, KEY_PLAY },        /* PLAY */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   64  	{ 0x021b, KEY_STOP },        /* STOP */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   65  	{ 0x021a, KEY_PLAYPAUSE },   /* TIMESHIFT / PAUSE */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   66  	{ 0x021d, KEY_BACK },        /* << / RED */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   67  	{ 0x021c, KEY_FORWARD },     /* >> / YELLOW */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   68  	{ 0x0203, KEY_TEXT },        /* TELETEXT */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   69  	{ 0x0204, KEY_EPG },         /* EPG */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   70  	{ 0x0215, KEY_MENU },        /* MENU */
58769a5486bec8e drivers/media/dvb/dvb-usb/a800.c Andrew Hodgson        2005-07-07   71  
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   72  	{ 0x0303, KEY_CHANNELUP },   /* CH UP */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   73  	{ 0x0302, KEY_CHANNELDOWN }, /* CH DOWN */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   74  	{ 0x0301, KEY_FIRST },       /* |<< / GREEN */
2e3658836efad06 drivers/media/dvb/dvb-usb/a800.c Mauro Carvalho Chehab 2009-08-29   75  	{ 0x0300, KEY_LAST },        /* >>| / BLUE */
58769a5486bec8e drivers/media/dvb/dvb-usb/a800.c Andrew Hodgson        2005-07-07   76  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   77  };
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   78  
15ac8e663b354ed drivers/media/dvb/dvb-usb/a800.c Adrian Bunk           2005-12-01   79  static int a800_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   80  {
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   81  	int ret;
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   82  	u8 *key = kmalloc(5, GFP_KERNEL);
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   83  	if (!key)
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   84  		return -ENOMEM;
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   85  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   86  	if (usb_control_msg(d->udev,usb_rcvctrlpipe(d->udev,0),
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   87  				0x04, USB_TYPE_VENDOR | USB_DIR_IN, 0, 0, key, 5,
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   88  				2000) != 5) {
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   89  		ret = -ENODEV;
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   90  		goto out;
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   91  	}
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   92  
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   93  	/* call the universal NEC remote processor, to find out the key's state and event */
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   94  	dvb_usb_nec_rc_key_to_event(d,key,event,state);
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23   95  	if (key[0] != 0)
5bdb7872cdadcd6 drivers/media/usb/dvb-usb/a800.c Andy Shevchenko       2012-09-26  @96  		deb_rc("key: %*ph\n", 5, key);
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   97  	ret = 0;
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   98  out:
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21   99  	kfree(key);
54f4e11ae3051ff drivers/media/dvb/dvb-usb/a800.c Florian Mickler       2011-03-21  100  	return ret;
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23  101  }
776338e121b9db3 drivers/media/dvb/dvb-usb/a800.c Johannes Stezenbach   2005-06-23  102  

:::::: The code at line 96 was first introduced by commit
:::::: 5bdb7872cdadcd630dd2129633e1a3f8aeac69f8 [media] dvb-usb: print small buffers via %*ph

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
