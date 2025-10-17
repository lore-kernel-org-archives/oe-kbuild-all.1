Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54081E32D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760704947; cv=none; b=AUobPVRDQ4tJwlG82FWRt+Tn1Qde0cWKBPiBEJR5g3D0Sp67C9jmD/IjMyN7ZMhT7tFUhBCpDxcR1NEOZMxbD+umJ40I/N/0504lCqjBgSpQxTSvWUKZ+Y4r0U+PSHgdEoPFsFLKnPqOjxhFeV5M+oAp7ikJ4NsXwc/NVSnHJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760704947; c=relaxed/simple;
	bh=XEGfSEjNIcnZLw8uk7HXaoeduQtgG27dsYvlmZT5EbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hqi88q6QLOwdpWTbWupIU0OfVf3bIi0hX3WuxxDHhOJTsTAzAvWewiz+hD1DONRbdZEnZGOTyvRU46ng0Gsi7U/Cb9/qnggwDxovvptu8v+DU+1H0Sl6rNceJpPu8XyZ04htlac2dU4GvwJnQzZLuD+BzEMKwUNglkXGSJR8cn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2bD4Sap; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2bD4Sap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760704945; x=1792240945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEGfSEjNIcnZLw8uk7HXaoeduQtgG27dsYvlmZT5EbI=;
  b=V2bD4Sapm/6WLIllIN63JrV0sykQd+TMK5au/pwxLyRtAh2huUk2Ctjs
   6CrX8ki8X1CT4Q0A8JfqlQWpwixXSOidXJkkCIkkFV9Yu17c95Oxu9AzH
   H+C4i79EptrSNo/BbGkiQzdl0SEcvzAUPdMel28q8Y/gbL4X02iPUqFYt
   bO5DkB+FhDLn6jbdCno6uzy8CAJoUr0rWWiHorlyMvyyzpeDpU7qp5aK4
   EHOLnIZzHtDpk5a8Qp3O2D5/lIl3XWrTgm7OhpXd4dMv2vNuGfs1djz2Q
   aMKYNTPnK1f+oEVzetDahY5r/geZXtQMasd9PjV4wCmxWFGrghKKf9/ME
   g==;
X-CSE-ConnectionGUID: PLxRzTV7Q7qM04vJVHhQQQ==
X-CSE-MsgGUID: ZSGT6oLrRPKtv542ApBz8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63059785"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="63059785"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 05:42:24 -0700
X-CSE-ConnectionGUID: yvPyA1ZkQRmKZK6habLodQ==
X-CSE-MsgGUID: HCI8/dd2QSi8322cV1Cq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181860363"
Received: from igk-lkp-server01.igk.intel.com (HELO e6a816730032) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2025 05:42:25 -0700
Received: from kbuild by e6a816730032 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v9jmn-0000000004P-461d;
	Fri, 17 Oct 2025 12:42:21 +0000
Date: Fri, 17 Oct 2025 14:41:40 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 5/19] drivers/hid/hid-apple.c:477:25:
 warning: this statement may fall through
Message-ID: <202510151644.SxZYjfQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   57763d4a44d353b9510a5673c597e6e74fc132f8
commit: 451569bd645d6d8dd98d351b10e7d062898d0f90 [5/19] HID: apple: Bind Apple silicon SPI devices
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251015/202510151644.SxZYjfQJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151644.SxZYjfQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151644.SxZYjfQJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-apple.c: In function 'hidinput_apple_event':
>> drivers/hid/hid-apple.c:477:25: warning: this statement may fall through [-Wimplicit-fallthrough=]
     477 |                         switch (hid->product) {
         |                         ^~~~~~
   drivers/hid/hid-apple.c:485:17: note: here
     485 |                 default:
         |                 ^~~~~~~


vim +477 drivers/hid/hid-apple.c

   418	
   419	static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
   420			struct hid_usage *usage, __s32 value)
   421	{
   422		struct apple_sc *asc = hid_get_drvdata(hid);
   423		const struct apple_key_translation *trans, *table;
   424		bool do_translate;
   425		u16 code = usage->code;
   426		unsigned int real_fnmode;
   427	
   428		if (fnmode == 3) {
   429			if (asc->quirks & APPLE_DISABLE_FKEYS)
   430				real_fnmode = 4;
   431			else if (asc->quirks & APPLE_IS_NON_APPLE)
   432				real_fnmode = 2;
   433			else
   434				real_fnmode = 1;
   435		} else {
   436			real_fnmode = fnmode;
   437		}
   438	
   439		if (swap_fn_leftctrl) {
   440			trans = apple_find_translation(swapped_fn_leftctrl_keys, code);
   441	
   442			if (trans)
   443				code = trans->to;
   444		}
   445	
   446		if (iso_layout > 0 || (iso_layout < 0 && (asc->quirks & APPLE_ISO_TILDE_QUIRK) &&
   447				hid->country == HID_COUNTRY_INTERNATIONAL_ISO)) {
   448			trans = apple_find_translation(apple_iso_keyboard, code);
   449	
   450			if (trans)
   451				code = trans->to;
   452		}
   453	
   454		if (swap_opt_cmd) {
   455			if (swap_opt_cmd == 2)
   456				trans = apple_find_translation(swapped_option_cmd_left_keys, code);
   457			else
   458				trans = apple_find_translation(swapped_option_cmd_keys, code);
   459	
   460			if (trans)
   461				code = trans->to;
   462		}
   463	
   464		if (swap_ctrl_cmd) {
   465			trans = apple_find_translation(swapped_ctrl_cmd_keys, code);
   466	
   467			if (trans)
   468				code = trans->to;
   469		}
   470	
   471		if (code == KEY_FN)
   472			asc->fn_on = !!value;
   473	
   474		if (real_fnmode) {
   475			switch (hid->bus) {
   476			case BUS_SPI:
 > 477				switch (hid->product) {
   478					case SPI_DEVICE_ID_APPLE_MACBOOK_PRO13_2020:
   479					table = macbookpro_dedicated_esc_fn_keys;
   480					break;
   481				default:
   482					table = magic_keyboard_2021_and_2024_fn_keys;
   483					break;
   484				}
   485			default:
   486			switch (hid->product) {
   487			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
   488			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
   489			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
   490			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
   491			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
   492			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
   493			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
   494			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
   495			case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
   496				table = magic_keyboard_alu_fn_keys;
   497				break;
   498			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
   499			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
   500				table = magic_keyboard_2015_fn_keys;
   501				break;
   502			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
   503			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
   504			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
   505			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
   506			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
   507			case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
   508				table = magic_keyboard_2021_and_2024_fn_keys;
   509				break;
   510			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
   511			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
   512			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
   513			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680_ALT:
   514				table = macbookpro_no_esc_fn_keys;
   515				break;
   516			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
   517			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
   518			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
   519				table = macbookpro_dedicated_esc_fn_keys;
   520				break;
   521			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
   522			case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
   523				table = apple_fn_keys;
   524				break;
   525			default:
   526				if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
   527				    hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
   528					table = macbookair_fn_keys;
   529				else if (hid->product < 0x21d || hid->product >= 0x300)
   530					table = powerbook_fn_keys;
   531				else
   532					table = apple_fn_keys;
   533			}
   534			}
   535	
   536			trans = apple_find_translation(table, code);
   537	
   538			if (trans) {
   539				bool from_is_set = test_bit(trans->from, input->key);
   540				bool to_is_set = test_bit(trans->to, input->key);
   541	
   542				if (from_is_set)
   543					code = trans->from;
   544				else if (to_is_set)
   545					code = trans->to;
   546	
   547				if (!(from_is_set || to_is_set)) {
   548					if (trans->flags & APPLE_FLAG_FKEY) {
   549						switch (real_fnmode) {
   550						case 1:
   551							do_translate = !asc->fn_on;
   552							break;
   553						case 2:
   554							do_translate = asc->fn_on;
   555							break;
   556						default:
   557							/* case 4 */
   558							do_translate = false;
   559						}
   560					} else if (trans->flags & APPLE_FLAG_TB_FKEY) {
   561						switch (real_fnmode) {
   562						case 4:
   563							do_translate = false;
   564							break;
   565						default:
   566							do_translate = asc->fn_on;
   567						}
   568					} else {
   569						do_translate = asc->fn_on;
   570					}
   571	
   572					if (do_translate)
   573						code = trans->to;
   574				}
   575			}
   576	
   577			if (asc->quirks & APPLE_NUMLOCK_EMULATION &&
   578					(test_bit(code, asc->pressed_numlock) ||
   579					test_bit(LED_NUML, input->led))) {
   580				trans = apple_find_translation(powerbook_numlock_keys, code);
   581	
   582				if (trans) {
   583					if (value)
   584						set_bit(code, asc->pressed_numlock);
   585					else
   586						clear_bit(code, asc->pressed_numlock);
   587	
   588					code = trans->to;
   589				}
   590			}
   591		}
   592	
   593		if (usage->code != code) {
   594			input_event_with_scancode(input, usage->type, code, usage->hid, value);
   595	
   596			return 1;
   597		}
   598	
   599		return 0;
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
