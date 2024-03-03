Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B07A71E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709508574; cv=none; b=HPscU3xKGzOB1ILu45lHT82tAF2VtPsHbki+7xMy8m5+l59m4Jo1ArRm6JWPJe5vnJg7D4NkNP6tMAdswTFgGVm1msUl/hhSTMIKXfNgBuWy7O+fdJGQFJapsDz74rys4zcr5EKvjGoP3wF0oglobDlRaJY63CftVLQ2L2WYpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709508574; c=relaxed/simple;
	bh=D1vFSL652eq5XYxvhYww6NjwsV4IxEk5X1Symbmcki0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NzW8UwbLYPCEM0IbbMISan5MwcdYZCzd/yB8RGshy5YWSKJ8KBb5iR4+9Sdtax9QbAaVhlVdhTKR52q5nkv9GLXX2l5+BedPjnwswM/tJILEZjdhXiGD3GFm4enMqyAZAJODccBiknWLl1ZjmuJQ4UWgDb7FihHwmU1sE7RMB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lje46P7k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lje46P7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709508571; x=1741044571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D1vFSL652eq5XYxvhYww6NjwsV4IxEk5X1Symbmcki0=;
  b=Lje46P7kRbQgwHheUVSetO6wCmV6Ck7fIam1LHL1TjEIw4PqUYVQisBS
   fwC0iXtI+9EAE0erYV25OHBlGMEShBLgJkmyWzEI0DkQ448OF+HvbFkt4
   5iUCfng26DQPEkhnh9CkOW/XLNmB8QBHAm2K13s0NiZ2AaHWZcAOpM3MB
   A0FJ66VT3Xy/D9pQJari9881n8gY6wSR9qVSEC92E2Yzz5RIWFBNT71kg
   sCamGRfb7/845pmLjlBs46j/Qo/mH0hEDXssDotOMzxa3vRjvaJ8qznIe
   wA9PZvZTHFMcfIZ4+4PdRkfmBMF3xfBy2B2x9LgsA6e5FN6IEeNG8JR1T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7803776"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7803776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 15:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9370451"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2024 15:29:30 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgvGp-0002Aa-0c;
	Sun, 03 Mar 2024 23:29:27 +0000
Date: Mon, 4 Mar 2024 07:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/cons-font-info/v1.0 1/5]
 drivers/tty/vt/vt_ioctl.c:483:3: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202403040754.RKosvxAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/cons-font-info/v1.0
head:   06733914c1d2d19ebb61cdf6cd96d0a45d4da6ba
commit: 784438040507c68171fd2c47597f8ab85c8e6ab8 [1/5] VT: Add KDFONTINFO ioctl
config: x86_64-randconfig-121-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040754.RKosvxAE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040754.RKosvxAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040754.RKosvxAE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/vt/vt_ioctl.c: In function 'vt_k_ioctl':
>> drivers/tty/vt/vt_ioctl.c:483:3: error: a label can only be part of a statement and a declaration is not a statement
      struct console_font_info fnt_info;
      ^~~~~~


vim +483 drivers/tty/vt/vt_ioctl.c

   355	
   356		/* Linux m68k/i386 interface for setting the keyboard delay/repeat rate */
   357	
   358		case KDKBDREP:
   359		{
   360			struct kbd_repeat kbrep;
   361	
   362			if (!capable(CAP_SYS_TTY_CONFIG))
   363				return -EPERM;
   364	
   365			if (copy_from_user(&kbrep, up, sizeof(struct kbd_repeat)))
   366				return -EFAULT;
   367	
   368			ret = kbd_rate(&kbrep);
   369			if (ret)
   370				return ret;
   371			if (copy_to_user(up, &kbrep, sizeof(struct kbd_repeat)))
   372				return -EFAULT;
   373			break;
   374		}
   375	
   376		case KDSETMODE:
   377			if (!perm)
   378				return -EPERM;
   379	
   380			console_lock();
   381			ret = vt_kdsetmode(vc, arg);
   382			console_unlock();
   383			return ret;
   384	
   385		case KDGETMODE:
   386			return put_user(vc->vc_mode, (int __user *)arg);
   387	
   388		case KDMAPDISP:
   389		case KDUNMAPDISP:
   390			/*
   391			 * these work like a combination of mmap and KDENABIO.
   392			 * this could be easily finished.
   393			 */
   394			return -EINVAL;
   395	
   396		case KDSKBMODE:
   397			if (!perm)
   398				return -EPERM;
   399			ret = vt_do_kdskbmode(console, arg);
   400			if (ret)
   401				return ret;
   402			tty_ldisc_flush(tty);
   403			break;
   404	
   405		case KDGKBMODE:
   406			return put_user(vt_do_kdgkbmode(console), (int __user *)arg);
   407	
   408		/* this could be folded into KDSKBMODE, but for compatibility
   409		   reasons it is not so easy to fold KDGKBMETA into KDGKBMODE */
   410		case KDSKBMETA:
   411			return vt_do_kdskbmeta(console, arg);
   412	
   413		case KDGKBMETA:
   414			/* FIXME: should review whether this is worth locking */
   415			return put_user(vt_do_kdgkbmeta(console), (int __user *)arg);
   416	
   417		case KDGETKEYCODE:
   418		case KDSETKEYCODE:
   419			if(!capable(CAP_SYS_TTY_CONFIG))
   420				perm = 0;
   421			return vt_do_kbkeycode_ioctl(cmd, up, perm);
   422	
   423		case KDGKBENT:
   424		case KDSKBENT:
   425			return vt_do_kdsk_ioctl(cmd, up, perm, console);
   426	
   427		case KDGKBSENT:
   428		case KDSKBSENT:
   429			return vt_do_kdgkb_ioctl(cmd, up, perm);
   430	
   431		/* Diacritical processing. Handled in keyboard.c as it has
   432		   to operate on the keyboard locks and structures */
   433		case KDGKBDIACR:
   434		case KDGKBDIACRUC:
   435		case KDSKBDIACR:
   436		case KDSKBDIACRUC:
   437			return vt_do_diacrit(cmd, up, perm);
   438	
   439		/* the ioctls below read/set the flags usually shown in the leds */
   440		/* don't use them - they will go away without warning */
   441		case KDGKBLED:
   442		case KDSKBLED:
   443		case KDGETLED:
   444		case KDSETLED:
   445			return vt_do_kdskled(console, cmd, arg, perm);
   446	
   447		/*
   448		 * A process can indicate its willingness to accept signals
   449		 * generated by pressing an appropriate key combination.
   450		 * Thus, one can have a daemon that e.g. spawns a new console
   451		 * upon a keypress and then changes to it.
   452		 * See also the kbrequest field of inittab(5).
   453		 */
   454		case KDSIGACCEPT:
   455			if (!perm || !capable(CAP_KILL))
   456				return -EPERM;
   457			if (!valid_signal(arg) || arg < 1 || arg == SIGKILL)
   458				return -EINVAL;
   459	
   460			spin_lock_irq(&vt_spawn_con.lock);
   461			put_pid(vt_spawn_con.pid);
   462			vt_spawn_con.pid = get_pid(task_pid(current));
   463			vt_spawn_con.sig = arg;
   464			spin_unlock_irq(&vt_spawn_con.lock);
   465			break;
   466	
   467		case KDFONTOP: {
   468			struct console_font_op op;
   469	
   470			if (copy_from_user(&op, up, sizeof(op)))
   471				return -EFAULT;
   472			if (!perm && op.op != KD_FONT_OP_GET)
   473				return -EPERM;
   474			ret = con_font_op(vc, &op);
   475			if (ret)
   476				return ret;
   477			if (copy_to_user(up, &op, sizeof(op)))
   478				return -EFAULT;
   479			break;
   480		}
   481	
   482		case KDFONTINFO:
 > 483			struct console_font_info fnt_info;
   484	
   485			if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
   486				return -EFAULT;
   487			ret = con_font_info(vc, &fnt_info);
   488			if (ret)
   489				return ret;
   490			if (copy_to_user(up, &fnt_info, sizeof(fnt_info)))
   491				return -EFAULT;
   492			break;
   493	
   494		default:
   495			return -ENOIOCTLCMD;
   496		}
   497	
   498		return 0;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
