Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDA190
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693009052; x=1724545052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwf7NwQEnJMtAYsSV5FrHTUNg3QZThO30J6pCzN+3ZQ=;
  b=ZxUgrYry4dEUDsAc6ewtDXEkr18tI/GAPjvQaEOfji8IfX1VqB66kPFB
   J3kBfrTTvcPYeNqotxCWZdET/8JY1gSLQ6zeAJo4w3YjDoBQNVaDiUN+d
   MJld4SnN+Ou3sxAbz5zYa+++b33O1JM2p6As95E8LRzPPLBN1ckHydDz+
   s3TVAa5n5N9WXVhtYZigkf/Ici778lmN0eUZExV3LHDLujkZrvNayryfj
   38UlspUo1RefzPw8mDGvqpHoX/t6HvcGIgQvgwQntHIUdQVOsNqRT5vcz
   igX5qYnZfjzx9jUJH3y2SuKydyHsGerc0o4P2VJtKAiLjsRodUQFRKjUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373702381"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373702381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772665792"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="772665792"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 17:17:29 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZgzW-00049t-2t;
	Sat, 26 Aug 2023 00:17:27 +0000
Date: Sat, 26 Aug 2023 08:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 16/17] drivers/parisc/led.c:230: warning:
 expecting prototype for led_ASP_driver(). Prototype was for LED_DATA()
 instead
Message-ID: <202308260852.g4VtO2UG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   eea22b2bd18bfc57c04f0ad468bc59e0a6996b2a
commit: e3b4e986bab2e7bd6d4cf27afaa65397fcf5b443 [16/17] parisc: led: Switch LCD/LED driver to use a kthread
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260852.g4VtO2UG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260852.g4VtO2UG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260852.g4VtO2UG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/parisc/led.c:230: warning: expecting prototype for led_ASP_driver(). Prototype was for LED_DATA() instead
>> drivers/parisc/led.c:250: warning: Function parameter or member 'leds' not described in 'led_LASI_driver'
>> drivers/parisc/led.c:259: warning: Function parameter or member 'leds' not described in 'led_LCD_driver'
>> drivers/parisc/led.c:406: warning: expecting prototype for led_mainlook(). Prototype was for HEARTBEAT_LEN() instead
>> drivers/parisc/led.c:494: warning: Function parameter or member 'nb' not described in 'led_halt'
>> drivers/parisc/led.c:494: warning: Function parameter or member 'event' not described in 'led_halt'
>> drivers/parisc/led.c:494: warning: Function parameter or member 'buf' not described in 'led_halt'
>> drivers/parisc/led.c:525: warning: Function parameter or member 'model' not described in 'register_led_driver'
>> drivers/parisc/led.c:525: warning: Function parameter or member 'cmd_reg' not described in 'register_led_driver'
>> drivers/parisc/led.c:525: warning: Function parameter or member 'data_reg' not described in 'register_led_driver'


vim +230 drivers/parisc/led.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  226  
e3b4e986bab2e7 Helge Deller      2023-08-25  227  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  228   *	led_ASP_driver() - LED driver for the ASP controller chip
^1da177e4c3f41 Linus Torvalds    2005-04-16  229   */
^1da177e4c3f41 Linus Torvalds    2005-04-16 @230  #define	LED_DATA	0x01	/* data to shift (0:on 1:off) */
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  #define	LED_STROBE	0x02	/* strobe to clock data */
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  static void led_ASP_driver(unsigned char leds)
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  	int i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  	leds = ~leds;
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  	for (i = 0; i < 8; i++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  		unsigned char value;
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  		value = (leds & 0x80) >> 7;
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  		gsc_writeb( value,		 LED_DATA_REG );
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  		gsc_writeb( value | LED_STROBE,	 LED_DATA_REG );
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  		leds <<= 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  
e3b4e986bab2e7 Helge Deller      2023-08-25  246  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  247   *	led_LASI_driver() - LED driver for the LASI controller chip
^1da177e4c3f41 Linus Torvalds    2005-04-16  248   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  static void led_LASI_driver(unsigned char leds)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @250  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  	leds = ~leds;
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  	gsc_writeb( leds, LED_DATA_REG );
^1da177e4c3f41 Linus Torvalds    2005-04-16  253  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  
e3b4e986bab2e7 Helge Deller      2023-08-25  255  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  256   *	led_LCD_driver() - LED & LCD driver for LCD chips
^1da177e4c3f41 Linus Torvalds    2005-04-16  257   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  static void led_LCD_driver(unsigned char leds)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @259  {
3499495205a676 Grant Grundler    2005-10-21  260  	static int i;
3499495205a676 Grant Grundler    2005-10-21  261  	static unsigned char mask[4] = { LED_HEARTBEAT, LED_DISK_IO,
3499495205a676 Grant Grundler    2005-10-21  262  		LED_LAN_RCV, LED_LAN_TX };
3499495205a676 Grant Grundler    2005-10-21  263  
3499495205a676 Grant Grundler    2005-10-21  264  	static struct lcd_block * blockp[4] = {
3499495205a676 Grant Grundler    2005-10-21  265  		&lcd_info.heartbeat,
3499495205a676 Grant Grundler    2005-10-21  266  		&lcd_info.disk_io,
3499495205a676 Grant Grundler    2005-10-21  267  		&lcd_info.lan_rcv,
3499495205a676 Grant Grundler    2005-10-21  268  		&lcd_info.lan_tx
3499495205a676 Grant Grundler    2005-10-21  269  	};
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  
e3b4e986bab2e7 Helge Deller      2023-08-25  271  	for (i = 0; i < 4; ++i) {
e3b4e986bab2e7 Helge Deller      2023-08-25  272  		if ((leds & mask[i]) == (lastleds & mask[i]))
e3b4e986bab2e7 Helge Deller      2023-08-25  273  			continue;
3499495205a676 Grant Grundler    2005-10-21  274  
3499495205a676 Grant Grundler    2005-10-21  275  		gsc_writeb( blockp[i]->command, LCD_CMD_REG );
e3b4e986bab2e7 Helge Deller      2023-08-25  276  		udelay(lcd_info.min_cmd_delay);
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  
3499495205a676 Grant Grundler    2005-10-21  278  		gsc_writeb( leds & mask[i] ? blockp[i]->on :
3499495205a676 Grant Grundler    2005-10-21  279  				blockp[i]->off, LCD_DATA_REG );
e3b4e986bab2e7 Helge Deller      2023-08-25  280  		udelay(lcd_info.min_cmd_delay);
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  
e3b4e986bab2e7 Helge Deller      2023-08-25  284  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  285   *	led_get_net_activity()
e3b4e986bab2e7 Helge Deller      2023-08-25  286   *
e3b4e986bab2e7 Helge Deller      2023-08-25  287   *	Calculate if there was TX- or RX-throughput on the network interfaces
e3b4e986bab2e7 Helge Deller      2023-08-25  288   *	(analog to dev_get_info() from net/core/dev.c)
^1da177e4c3f41 Linus Torvalds    2005-04-16  289   */
e3b4e986bab2e7 Helge Deller      2023-08-25  290  static int led_get_net_activity(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  291  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  292  #ifndef CONFIG_NET
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  294  #else
c442ef96bfe1a9 Kyle McMartin     2010-09-28  295  	static u64 rx_total_last, tx_total_last;
c442ef96bfe1a9 Kyle McMartin     2010-09-28  296  	u64 rx_total, tx_total;
^1da177e4c3f41 Linus Torvalds    2005-04-16  297  	struct net_device *dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  298  	int retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  299  
^1da177e4c3f41 Linus Torvalds    2005-04-16  300  	rx_total = tx_total = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  301  
246c65add098a5 Eric Dumazet      2009-11-09  302  	/* we are running as a workqueue task, so we can use an RCU lookup */
e5ed639913eea3 Herbert Xu        2005-10-03  303  	rcu_read_lock();
246c65add098a5 Eric Dumazet      2009-11-09  304  	for_each_netdev_rcu(&init_net, dev) {
c442ef96bfe1a9 Kyle McMartin     2010-09-28  305  	    const struct rtnl_link_stats64 *stats;
28172739f0a276 Eric Dumazet      2010-07-07  306  	    struct rtnl_link_stats64 temp;
e5ed639913eea3 Herbert Xu        2005-10-03  307  	    struct in_device *in_dev = __in_dev_get_rcu(dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  	    if (!in_dev || !in_dev->ifa_list)
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  		continue;
17159b0b494ad2 Joe Perches       2007-12-16  310  	    if (ipv4_is_loopback(in_dev->ifa_list->ifa_local))
^1da177e4c3f41 Linus Torvalds    2005-04-16  311  		continue;
28172739f0a276 Eric Dumazet      2010-07-07  312  	    stats = dev_get_stats(dev, &temp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  313  	    rx_total += stats->rx_packets;
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  	    tx_total += stats->tx_packets;
^1da177e4c3f41 Linus Torvalds    2005-04-16  315  	}
e5ed639913eea3 Herbert Xu        2005-10-03  316  	rcu_read_unlock();
^1da177e4c3f41 Linus Torvalds    2005-04-16  317  
^1da177e4c3f41 Linus Torvalds    2005-04-16  318  	retval = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  
^1da177e4c3f41 Linus Torvalds    2005-04-16  320  	if (rx_total != rx_total_last) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  		rx_total_last = rx_total;
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  		retval |= LED_LAN_RCV;
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  	if (tx_total != tx_total_last) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  326  		tx_total_last = tx_total;
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  		retval |= LED_LAN_TX;
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  329  
^1da177e4c3f41 Linus Torvalds    2005-04-16  330  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  331  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  332  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  333  
^1da177e4c3f41 Linus Torvalds    2005-04-16  334  
e3b4e986bab2e7 Helge Deller      2023-08-25  335  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  336   *	led_get_diskio_activity()
e3b4e986bab2e7 Helge Deller      2023-08-25  337   *
e3b4e986bab2e7 Helge Deller      2023-08-25  338   *	calculate if there was disk-io in the system.
^1da177e4c3f41 Linus Torvalds    2005-04-16  339   */
e3b4e986bab2e7 Helge Deller      2023-08-25  340  static int led_get_diskio_activity(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  341  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  342  	static unsigned long last_pgpgin, last_pgpgout;
f8891e5e1f93a1 Christoph Lameter 2006-06-30  343  	unsigned long events[NR_VM_EVENT_ITEMS];
^1da177e4c3f41 Linus Torvalds    2005-04-16  344  	int changed;
^1da177e4c3f41 Linus Torvalds    2005-04-16  345  
f8891e5e1f93a1 Christoph Lameter 2006-06-30  346  	all_vm_events(events);
^1da177e4c3f41 Linus Torvalds    2005-04-16  347  
^1da177e4c3f41 Linus Torvalds    2005-04-16  348  	/* Just use a very simple calculation here. Do not care about overflow,
^1da177e4c3f41 Linus Torvalds    2005-04-16  349  	   since we only want to know if there was activity or not. */
f8891e5e1f93a1 Christoph Lameter 2006-06-30  350  	changed = (events[PGPGIN] != last_pgpgin) ||
f8891e5e1f93a1 Christoph Lameter 2006-06-30  351  		  (events[PGPGOUT] != last_pgpgout);
f8891e5e1f93a1 Christoph Lameter 2006-06-30  352  	last_pgpgin  = events[PGPGIN];
f8891e5e1f93a1 Christoph Lameter 2006-06-30  353  	last_pgpgout = events[PGPGOUT];
^1da177e4c3f41 Linus Torvalds    2005-04-16  354  
^1da177e4c3f41 Linus Torvalds    2005-04-16  355  	return (changed ? LED_DISK_IO : 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  356  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  
e3b4e986bab2e7 Helge Deller      2023-08-25  358  static void lcd_print_now(void)
e3b4e986bab2e7 Helge Deller      2023-08-25  359  {
e3b4e986bab2e7 Helge Deller      2023-08-25  360  	int i;
e3b4e986bab2e7 Helge Deller      2023-08-25  361  	char *str = lcd_text;
e3b4e986bab2e7 Helge Deller      2023-08-25  362  
e3b4e986bab2e7 Helge Deller      2023-08-25  363  	if (lcd_info.model != DISPLAY_MODEL_LCD)
e3b4e986bab2e7 Helge Deller      2023-08-25  364  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  365  
e3b4e986bab2e7 Helge Deller      2023-08-25  366  	if (!lcd_new_text)
e3b4e986bab2e7 Helge Deller      2023-08-25  367  		return;
e3b4e986bab2e7 Helge Deller      2023-08-25  368  	lcd_new_text = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  369  
e3b4e986bab2e7 Helge Deller      2023-08-25  370  	/* Set LCD Cursor to 1st character */
e3b4e986bab2e7 Helge Deller      2023-08-25  371  	gsc_writeb(lcd_info.reset_cmd1, LCD_CMD_REG);
e3b4e986bab2e7 Helge Deller      2023-08-25  372  	udelay(lcd_info.min_cmd_delay);
e3b4e986bab2e7 Helge Deller      2023-08-25  373  
e3b4e986bab2e7 Helge Deller      2023-08-25  374  	/* Print the string */
e3b4e986bab2e7 Helge Deller      2023-08-25  375  	for (i = 0; i < lcd_info.lcd_width; i++) {
e3b4e986bab2e7 Helge Deller      2023-08-25  376  		gsc_writeb(*str ? *str++ : ' ', LCD_DATA_REG);
e3b4e986bab2e7 Helge Deller      2023-08-25  377  		udelay(lcd_info.min_cmd_delay);
e3b4e986bab2e7 Helge Deller      2023-08-25  378  	}
e3b4e986bab2e7 Helge Deller      2023-08-25  379  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  380  
e3b4e986bab2e7 Helge Deller      2023-08-25  381  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  382   *	lcd_print()
e3b4e986bab2e7 Helge Deller      2023-08-25  383   *
e3b4e986bab2e7 Helge Deller      2023-08-25  384   *	@str: string to show on the LCD. If NULL, print current string again.
e3b4e986bab2e7 Helge Deller      2023-08-25  385   *
e3b4e986bab2e7 Helge Deller      2023-08-25  386   *	Displays the given string on the LCD-Display of newer machines.
^1da177e4c3f41 Linus Torvalds    2005-04-16  387   */
e3b4e986bab2e7 Helge Deller      2023-08-25  388  void lcd_print(const char *str)
e3b4e986bab2e7 Helge Deller      2023-08-25  389  {
e3b4e986bab2e7 Helge Deller      2023-08-25  390  	/* copy display string to buffer for procfs */
e3b4e986bab2e7 Helge Deller      2023-08-25  391  	if (str)
e3b4e986bab2e7 Helge Deller      2023-08-25  392  		strscpy(lcd_text, str, sizeof(lcd_text));
e3b4e986bab2e7 Helge Deller      2023-08-25  393  	lcd_new_text = 1;
e3b4e986bab2e7 Helge Deller      2023-08-25  394  
e3b4e986bab2e7 Helge Deller      2023-08-25  395  	/* a LCD without LEDs, has no kthread and thus print it now */
e3b4e986bab2e7 Helge Deller      2023-08-25  396  	if (!kthread_led_task)
e3b4e986bab2e7 Helge Deller      2023-08-25  397  		lcd_print_now();
e3b4e986bab2e7 Helge Deller      2023-08-25  398  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  399  
e3b4e986bab2e7 Helge Deller      2023-08-25  400  
e3b4e986bab2e7 Helge Deller      2023-08-25  401  /**
e3b4e986bab2e7 Helge Deller      2023-08-25  402   *	led_mainlook()
e3b4e986bab2e7 Helge Deller      2023-08-25  403   *
e3b4e986bab2e7 Helge Deller      2023-08-25  404   *	Kernel thread which updates chassis LCD and LEDs
e3b4e986bab2e7 Helge Deller      2023-08-25  405   */
3499495205a676 Grant Grundler    2005-10-21 @406  #define HEARTBEAT_LEN (HZ*10/100)
3499495205a676 Grant Grundler    2005-10-21  407  #define HEARTBEAT_2ND_RANGE_START (HZ*28/100)
^1da177e4c3f41 Linus Torvalds    2005-04-16  408  #define HEARTBEAT_2ND_RANGE_END   (HEARTBEAT_2ND_RANGE_START + HEARTBEAT_LEN)
^1da177e4c3f41 Linus Torvalds    2005-04-16  409  

:::::: The code at line 230 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
