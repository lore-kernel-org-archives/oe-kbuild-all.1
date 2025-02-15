Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99C15A843
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739609002; cv=none; b=E7pc4wNN6JupjiNDRZh0dKIc3dzRBy8B9vITvSB+W8PK4RmTPHswUWly+wT0PAOrpVWgIst5Yyvcp9SrdT7lKMIcx56xXFOY6I9n9yjBJnEimv2+N9Q/W1DIn+ipz+HNfjT+Gwpy/ILvFr+zwqjnEhV+ADViOPnobWz1S/+IrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739609002; c=relaxed/simple;
	bh=CJIeHpsvtz/jucmM2LzsgzEV7hfChhfa16fEHEjHNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsitM71e90Rlv6qx5rF3FczM4ZwsMqjSpAPBPOqufLfR/SO78Qw4QzAIC+VOH8UczsAqYLOYR7hehwvZuX10YfonllNCdB3UbS/06lPKoEegcdwChnWXVITfQ00NO1EWel6qEzZ3aLsdb8RtGA/5ceXDEHw/f8ku0sFgZbuO4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNBrJGEu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNBrJGEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739609000; x=1771145000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJIeHpsvtz/jucmM2LzsgzEV7hfChhfa16fEHEjHNe0=;
  b=aNBrJGEuVJCOFbDNRjju7+63Irmk1ULd8Hr/D4P6uZ/pcvoKjlKe+iWJ
   VzUVf9I7HSPIxY2dhzoXW3GkE/4OvwFKvZP8O2CdaLab8h0tx/7bZe12d
   oTCAgo/B0DsBD2+QXVrbs0wyR+Db1ASS9Ibmm2DM2hdxADdEQSaoaOSYU
   F6DW7U2hsT+W0/sXeD0Sq7tTE79X2T9u5SWVHUkdJj4IVuEJ2QIjacFrE
   VuboVK5RJTCdoN2u994VHZtTsyP5twq5boq7RSJyp5pc3UqppWrj90eyM
   TbzGVZjcRccYwsd1QfdyP2V0ix5Ngrgw2O0D6tySRXphUXJqRZuJKYOKR
   A==;
X-CSE-ConnectionGUID: jQ5QTVb0RLeiqyGti2c5Xw==
X-CSE-MsgGUID: wFRKh4pLTjSz8jf+0dZXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40389552"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="40389552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 00:43:20 -0800
X-CSE-ConnectionGUID: n3mAhlw6SneT9WTP1QW9IQ==
X-CSE-MsgGUID: +bKUG+zJQVuZQ5Ukj+E3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="113643870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2025 00:43:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjDlc-001Adb-0W;
	Sat, 15 Feb 2025 08:43:16 +0000
Date: Sat, 15 Feb 2025 16:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/unicode/v1.0 2/4]
 kernel/debug/kdb/kdb_keyboard.c:162:27: error: incompatible types when
 assigning to type 'u_short' {aka 'short unsigned int'} from type
 'kunicode_t'
Message-ID: <202502151633.EGFkuoIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/unicode/v1.0
head:   0768a465fe612409155871d9fbec677ec9d3e0bd
commit: e248d79e5d168054106578b51107a79635670e29 [2/4] vt: Make a new type for unicode
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502151633.EGFkuoIg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151633.EGFkuoIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151633.EGFkuoIg-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/debug/kdb/kdb_keyboard.c: In function 'kdb_get_kbd_char':
>> kernel/debug/kdb/kdb_keyboard.c:162:27: error: incompatible types when assigning to type 'u_short' {aka 'short unsigned int'} from type 'kunicode_t'
     162 |                 keychar = plain_map[scancode];
         |                           ^~~~~~~~~
   kernel/debug/kdb/kdb_keyboard.c:164:27: error: incompatible types when assigning to type 'u_short' {aka 'short unsigned int'} from type 'kunicode_t'
     164 |                 keychar = key_maps[1][scancode];
         |                           ^~~~~~~~
   kernel/debug/kdb/kdb_keyboard.c:166:27: error: incompatible types when assigning to type 'u_short' {aka 'short unsigned int'} from type 'kunicode_t'
     166 |                 keychar = key_maps[4][scancode];
         |                           ^~~~~~~~


vim +162 kernel/debug/kdb/kdb_keyboard.c

ada64e4c98eb5f Jason Wessel        2010-05-20   32  
ada64e4c98eb5f Jason Wessel        2010-05-20   33  /*
ada64e4c98eb5f Jason Wessel        2010-05-20   34   * Check if the keyboard controller has a keypress for us.
ada64e4c98eb5f Jason Wessel        2010-05-20   35   * Some parts (Enter Release, LED change) are still blocking polled here,
ada64e4c98eb5f Jason Wessel        2010-05-20   36   * but hopefully they are all short.
ada64e4c98eb5f Jason Wessel        2010-05-20   37   */
ada64e4c98eb5f Jason Wessel        2010-05-20   38  int kdb_get_kbd_char(void)
ada64e4c98eb5f Jason Wessel        2010-05-20   39  {
ada64e4c98eb5f Jason Wessel        2010-05-20   40  	int scancode, scanstatus;
ada64e4c98eb5f Jason Wessel        2010-05-20   41  	static int shift_lock;	/* CAPS LOCK state (0-off, 1-on) */
ada64e4c98eb5f Jason Wessel        2010-05-20   42  	static int shift_key;	/* Shift next keypress */
ada64e4c98eb5f Jason Wessel        2010-05-20   43  	static int ctrl_key;
ada64e4c98eb5f Jason Wessel        2010-05-20   44  	u_short keychar;
ada64e4c98eb5f Jason Wessel        2010-05-20   45  
ada64e4c98eb5f Jason Wessel        2010-05-20   46  	if (KDB_FLAG(NO_I8042) || KDB_FLAG(NO_VT_CONSOLE) ||
ada64e4c98eb5f Jason Wessel        2010-05-20   47  	    (inb(KBD_STATUS_REG) == 0xff && inb(KBD_DATA_REG) == 0xff)) {
ada64e4c98eb5f Jason Wessel        2010-05-20   48  		kbd_exists = 0;
ada64e4c98eb5f Jason Wessel        2010-05-20   49  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20   50  	}
ada64e4c98eb5f Jason Wessel        2010-05-20   51  	kbd_exists = 1;
ada64e4c98eb5f Jason Wessel        2010-05-20   52  
ada64e4c98eb5f Jason Wessel        2010-05-20   53  	if ((inb(KBD_STATUS_REG) & KBD_STAT_OBF) == 0)
ada64e4c98eb5f Jason Wessel        2010-05-20   54  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20   55  
ada64e4c98eb5f Jason Wessel        2010-05-20   56  	/*
ada64e4c98eb5f Jason Wessel        2010-05-20   57  	 * Fetch the scancode
ada64e4c98eb5f Jason Wessel        2010-05-20   58  	 */
ada64e4c98eb5f Jason Wessel        2010-05-20   59  	scancode = inb(KBD_DATA_REG);
ada64e4c98eb5f Jason Wessel        2010-05-20   60  	scanstatus = inb(KBD_STATUS_REG);
ada64e4c98eb5f Jason Wessel        2010-05-20   61  
ada64e4c98eb5f Jason Wessel        2010-05-20   62  	/*
ada64e4c98eb5f Jason Wessel        2010-05-20   63  	 * Ignore mouse events.
ada64e4c98eb5f Jason Wessel        2010-05-20   64  	 */
ada64e4c98eb5f Jason Wessel        2010-05-20   65  	if (scanstatus & KBD_STAT_MOUSE_OBF)
ada64e4c98eb5f Jason Wessel        2010-05-20   66  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20   67  
ada64e4c98eb5f Jason Wessel        2010-05-20   68  	/*
ada64e4c98eb5f Jason Wessel        2010-05-20   69  	 * Ignore release, trigger on make
ada64e4c98eb5f Jason Wessel        2010-05-20   70  	 * (except for shift keys, where we want to
ada64e4c98eb5f Jason Wessel        2010-05-20   71  	 *  keep the shift state so long as the key is
ada64e4c98eb5f Jason Wessel        2010-05-20   72  	 *  held down).
ada64e4c98eb5f Jason Wessel        2010-05-20   73  	 */
ada64e4c98eb5f Jason Wessel        2010-05-20   74  
ada64e4c98eb5f Jason Wessel        2010-05-20   75  	if (((scancode&0x7f) == 0x2a) || ((scancode&0x7f) == 0x36)) {
ada64e4c98eb5f Jason Wessel        2010-05-20   76  		/*
ada64e4c98eb5f Jason Wessel        2010-05-20   77  		 * Next key may use shift table
ada64e4c98eb5f Jason Wessel        2010-05-20   78  		 */
ada64e4c98eb5f Jason Wessel        2010-05-20   79  		if ((scancode & 0x80) == 0)
ada64e4c98eb5f Jason Wessel        2010-05-20   80  			shift_key = 1;
ada64e4c98eb5f Jason Wessel        2010-05-20   81  		else
ada64e4c98eb5f Jason Wessel        2010-05-20   82  			shift_key = 0;
ada64e4c98eb5f Jason Wessel        2010-05-20   83  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20   84  	}
ada64e4c98eb5f Jason Wessel        2010-05-20   85  
ada64e4c98eb5f Jason Wessel        2010-05-20   86  	if ((scancode&0x7f) == 0x1d) {
ada64e4c98eb5f Jason Wessel        2010-05-20   87  		/*
ada64e4c98eb5f Jason Wessel        2010-05-20   88  		 * Left ctrl key
ada64e4c98eb5f Jason Wessel        2010-05-20   89  		 */
ada64e4c98eb5f Jason Wessel        2010-05-20   90  		if ((scancode & 0x80) == 0)
ada64e4c98eb5f Jason Wessel        2010-05-20   91  			ctrl_key = 1;
ada64e4c98eb5f Jason Wessel        2010-05-20   92  		else
ada64e4c98eb5f Jason Wessel        2010-05-20   93  			ctrl_key = 0;
ada64e4c98eb5f Jason Wessel        2010-05-20   94  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20   95  	}
ada64e4c98eb5f Jason Wessel        2010-05-20   96  
8f30d411767351 Andrei Warkentin    2012-02-28   97  	if ((scancode & 0x80) != 0) {
8f30d411767351 Andrei Warkentin    2012-02-28   98  		if (scancode == 0x9c)
8f30d411767351 Andrei Warkentin    2012-02-28   99  			kbd_last_ret = 0;
ada64e4c98eb5f Jason Wessel        2010-05-20  100  		return -1;
8f30d411767351 Andrei Warkentin    2012-02-28  101  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  102  
ada64e4c98eb5f Jason Wessel        2010-05-20  103  	scancode &= 0x7f;
ada64e4c98eb5f Jason Wessel        2010-05-20  104  
ada64e4c98eb5f Jason Wessel        2010-05-20  105  	/*
ada64e4c98eb5f Jason Wessel        2010-05-20  106  	 * Translate scancode
ada64e4c98eb5f Jason Wessel        2010-05-20  107  	 */
ada64e4c98eb5f Jason Wessel        2010-05-20  108  
ada64e4c98eb5f Jason Wessel        2010-05-20  109  	if (scancode == 0x3a) {
ada64e4c98eb5f Jason Wessel        2010-05-20  110  		/*
ada64e4c98eb5f Jason Wessel        2010-05-20  111  		 * Toggle caps lock
ada64e4c98eb5f Jason Wessel        2010-05-20  112  		 */
ada64e4c98eb5f Jason Wessel        2010-05-20  113  		shift_lock ^= 1;
ada64e4c98eb5f Jason Wessel        2010-05-20  114  
ada64e4c98eb5f Jason Wessel        2010-05-20  115  #ifdef	KDB_BLINK_LED
ada64e4c98eb5f Jason Wessel        2010-05-20  116  		kdb_toggleled(0x4);
ada64e4c98eb5f Jason Wessel        2010-05-20  117  #endif
ada64e4c98eb5f Jason Wessel        2010-05-20  118  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20  119  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  120  
ada64e4c98eb5f Jason Wessel        2010-05-20  121  	if (scancode == 0x0e) {
ada64e4c98eb5f Jason Wessel        2010-05-20  122  		/*
ada64e4c98eb5f Jason Wessel        2010-05-20  123  		 * Backspace
ada64e4c98eb5f Jason Wessel        2010-05-20  124  		 */
ada64e4c98eb5f Jason Wessel        2010-05-20  125  		return 8;
ada64e4c98eb5f Jason Wessel        2010-05-20  126  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  127  
24b2455fe8fce1 Nir Lichtman        2024-11-11  128  	/* Translate special keys to equivalent CTRL control characters */
ada64e4c98eb5f Jason Wessel        2010-05-20  129  	switch (scancode) {
ada64e4c98eb5f Jason Wessel        2010-05-20  130  	case 0xF: /* Tab */
24b2455fe8fce1 Nir Lichtman        2024-11-11  131  		return CTRL('I');
ada64e4c98eb5f Jason Wessel        2010-05-20  132  	case 0x53: /* Del */
24b2455fe8fce1 Nir Lichtman        2024-11-11  133  		return CTRL('D');
ada64e4c98eb5f Jason Wessel        2010-05-20  134  	case 0x47: /* Home */
24b2455fe8fce1 Nir Lichtman        2024-11-11  135  		return CTRL('A');
ada64e4c98eb5f Jason Wessel        2010-05-20  136  	case 0x4F: /* End */
24b2455fe8fce1 Nir Lichtman        2024-11-11  137  		return CTRL('E');
ada64e4c98eb5f Jason Wessel        2010-05-20  138  	case 0x4B: /* Left */
24b2455fe8fce1 Nir Lichtman        2024-11-11  139  		return CTRL('B');
ada64e4c98eb5f Jason Wessel        2010-05-20  140  	case 0x48: /* Up */
24b2455fe8fce1 Nir Lichtman        2024-11-11  141  		return CTRL('P');
ada64e4c98eb5f Jason Wessel        2010-05-20  142  	case 0x50: /* Down */
24b2455fe8fce1 Nir Lichtman        2024-11-11  143  		return CTRL('N');
ada64e4c98eb5f Jason Wessel        2010-05-20  144  	case 0x4D: /* Right */
24b2455fe8fce1 Nir Lichtman        2024-11-11  145  		return CTRL('F');
ada64e4c98eb5f Jason Wessel        2010-05-20  146  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  147  
ada64e4c98eb5f Jason Wessel        2010-05-20  148  	if (scancode == 0xe0)
ada64e4c98eb5f Jason Wessel        2010-05-20  149  		return -1;
ada64e4c98eb5f Jason Wessel        2010-05-20  150  
ada64e4c98eb5f Jason Wessel        2010-05-20  151  	/*
ada64e4c98eb5f Jason Wessel        2010-05-20  152  	 * For Japanese 86/106 keyboards
ada64e4c98eb5f Jason Wessel        2010-05-20  153  	 * 	See comment in drivers/char/pc_keyb.c.
ada64e4c98eb5f Jason Wessel        2010-05-20  154  	 * 	- Masahiro Adegawa
ada64e4c98eb5f Jason Wessel        2010-05-20  155  	 */
ada64e4c98eb5f Jason Wessel        2010-05-20  156  	if (scancode == 0x73)
ada64e4c98eb5f Jason Wessel        2010-05-20  157  		scancode = 0x59;
ada64e4c98eb5f Jason Wessel        2010-05-20  158  	else if (scancode == 0x7d)
ada64e4c98eb5f Jason Wessel        2010-05-20  159  		scancode = 0x7c;
ada64e4c98eb5f Jason Wessel        2010-05-20  160  
ada64e4c98eb5f Jason Wessel        2010-05-20  161  	if (!shift_lock && !shift_key && !ctrl_key) {
ada64e4c98eb5f Jason Wessel        2010-05-20 @162  		keychar = plain_map[scancode];
ada64e4c98eb5f Jason Wessel        2010-05-20  163  	} else if ((shift_lock || shift_key) && key_maps[1]) {
ada64e4c98eb5f Jason Wessel        2010-05-20  164  		keychar = key_maps[1][scancode];
ada64e4c98eb5f Jason Wessel        2010-05-20  165  	} else if (ctrl_key && key_maps[4]) {
ada64e4c98eb5f Jason Wessel        2010-05-20  166  		keychar = key_maps[4][scancode];
ada64e4c98eb5f Jason Wessel        2010-05-20  167  	} else {
ada64e4c98eb5f Jason Wessel        2010-05-20  168  		keychar = 0x0020;
ada64e4c98eb5f Jason Wessel        2010-05-20  169  		kdb_printf("Unknown state/scancode (%d)\n", scancode);
ada64e4c98eb5f Jason Wessel        2010-05-20  170  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  171  	keychar &= 0x0fff;
ada64e4c98eb5f Jason Wessel        2010-05-20  172  	if (keychar == '\t')
ada64e4c98eb5f Jason Wessel        2010-05-20  173  		keychar = ' ';
ada64e4c98eb5f Jason Wessel        2010-05-20  174  	switch (KTYP(keychar)) {
ada64e4c98eb5f Jason Wessel        2010-05-20  175  	case KT_LETTER:
ada64e4c98eb5f Jason Wessel        2010-05-20  176  	case KT_LATIN:
24b2455fe8fce1 Nir Lichtman        2024-11-11  177  		switch (keychar) {
24b2455fe8fce1 Nir Lichtman        2024-11-11  178  		/* non-printable supported control characters */
24b2455fe8fce1 Nir Lichtman        2024-11-11  179  		case CTRL('A'): /* Home */
24b2455fe8fce1 Nir Lichtman        2024-11-11  180  		case CTRL('B'): /* Left */
24b2455fe8fce1 Nir Lichtman        2024-11-11  181  		case CTRL('D'): /* Del */
24b2455fe8fce1 Nir Lichtman        2024-11-11  182  		case CTRL('E'): /* End */
24b2455fe8fce1 Nir Lichtman        2024-11-11  183  		case CTRL('F'): /* Right */
24b2455fe8fce1 Nir Lichtman        2024-11-11  184  		case CTRL('I'): /* Tab */
24b2455fe8fce1 Nir Lichtman        2024-11-11  185  		case CTRL('N'): /* Down */
24b2455fe8fce1 Nir Lichtman        2024-11-11  186  		case CTRL('P'): /* Up */
24b2455fe8fce1 Nir Lichtman        2024-11-11  187  			return keychar;
24b2455fe8fce1 Nir Lichtman        2024-11-11  188  		}
24b2455fe8fce1 Nir Lichtman        2024-11-11  189  
ada64e4c98eb5f Jason Wessel        2010-05-20  190  		if (isprint(keychar))
ada64e4c98eb5f Jason Wessel        2010-05-20  191  			break;		/* printable characters */
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  192  		fallthrough;
ada64e4c98eb5f Jason Wessel        2010-05-20  193  	case KT_SPEC:
ada64e4c98eb5f Jason Wessel        2010-05-20  194  		if (keychar == K_ENTER)
ada64e4c98eb5f Jason Wessel        2010-05-20  195  			break;
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  196  		fallthrough;
ada64e4c98eb5f Jason Wessel        2010-05-20  197  	default:
ada64e4c98eb5f Jason Wessel        2010-05-20  198  		return -1;	/* ignore unprintables */
ada64e4c98eb5f Jason Wessel        2010-05-20  199  	}
ada64e4c98eb5f Jason Wessel        2010-05-20  200  
8f30d411767351 Andrei Warkentin    2012-02-28  201  	if (scancode == 0x1c) {
8f30d411767351 Andrei Warkentin    2012-02-28  202  		kbd_last_ret = 1;
8f30d411767351 Andrei Warkentin    2012-02-28  203  		return 13;
8f30d411767351 Andrei Warkentin    2012-02-28  204  	}
8f30d411767351 Andrei Warkentin    2012-02-28  205  
8f30d411767351 Andrei Warkentin    2012-02-28  206  	return keychar & 0xff;
8f30d411767351 Andrei Warkentin    2012-02-28  207  }
8f30d411767351 Andrei Warkentin    2012-02-28  208  EXPORT_SYMBOL_GPL(kdb_get_kbd_char);
8f30d411767351 Andrei Warkentin    2012-02-28  209  

:::::: The code at line 162 was first introduced by commit
:::::: ada64e4c98eb5f04a9ca223c5ff9e7ac22ce6404 kgdboc,keyboard: Keyboard driver for kdb with kgdb

:::::: TO: Jason Wessel <jason.wessel@windriver.com>
:::::: CC: Jason Wessel <jason.wessel@windriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
