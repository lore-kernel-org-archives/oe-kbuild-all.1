Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE3626A1C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 05:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659960; cv=none; b=HsgH5C+gneqTRw/YZKgMmrDjcCrTlL/AnaKk7eq+MuW/SKk1N8k+65qFEQibMwpnmDt7rB7V2lj21hyAP7Rway5pfoQk7sIoiSJdLzKbKhcOUgj47qPvxDRJJg4hTdyfdgM24bdKbczejTYA0CMGm7WIlGbVTkuG0dOUZgQQMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659960; c=relaxed/simple;
	bh=mov1RawLUAxqMCIUQCRYZ/fbkLWKVTiMrnXXYewV6bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p/gkqrQqyqpoALOVVIo7SuOzVJ0t5y/8d/gXdr7wjzjYYCxkDLuJHSqM72+Pnakt1kWw4lh+C5yy/40fuUaE/tq2JXHH7zhkzq3A5AlZX5dxA6hPFfj46gMuOVA0T72RFNWQK7waqoq4ZRDCEMchWdr/ai0+CFGzI9jgL/5VCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeEUAhJ6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeEUAhJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783659957; x=1815195957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mov1RawLUAxqMCIUQCRYZ/fbkLWKVTiMrnXXYewV6bQ=;
  b=SeEUAhJ6z6uy3Tw8TF5mEiEzfXKM3dk4iQWPA94EC6VNM9P8/wTgbSOP
   l19Ja8RecQCY2Z7o19v6EHjYgSNr1hFTIB2LA3MvuxrjfY78LxVk/OC66
   qH4Fw8in1sguAuz+Wa3Vs9P5LDRGj857xxgFPs4LALNt/G0Udq1yNMTRv
   6TmuxK79il3qXFH+1OkhdO4ZJDt9ZndVlR87zXVXlq0Fp18FqN89mD0nj
   Sr8s8k8JBNNGg6g8RF+ptHwKe2gr2EsWP5e7DCUl6pnRDh8HkyQu2uZts
   ApaqSbtkqmqoW+fo7R6qz0vwHEFOYMP/aYvCwQWfE49O4xqhEn7jNbq+o
   A==;
X-CSE-ConnectionGUID: Jryga4A7TveP+SocEDLdIA==
X-CSE-MsgGUID: MLnRYG50T7O1lo87K2puKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83333901"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83333901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 22:05:57 -0700
X-CSE-ConnectionGUID: h4wvQx4nTpOqtsySKr2aIg==
X-CSE-MsgGUID: t5cjWgelRDWcJZiJRHP5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250780012"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 22:05:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi3Qq-00000000IWJ-2aRg;
	Fri, 10 Jul 2026 05:05:49 +0000
Date: Fri, 10 Jul 2026 13:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-7.2.y-rt-rebase 1/17]
 drivers/tty/serial/8250/8250_port.c:3257 serial8250_fifo_wait_for_lsr_thre()
 warn: inconsistent indenting
Message-ID: <202607101238.CUhuF09M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-7.2.y-rt-rebase
head:   8539be5dc459ac9989806747ef44b2566c2a7981
commit: 03dd6d771fb6be5f870d15b77b9e049407eb3901 [1/17] Reapply "serial: 82=
50: Switch to nbcon console"
config: nios2-randconfig-r071-20260710 (https://download.01.org/0day-ci/arc=
hive/20260710/202607101238.CUhuF09M-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101238.CUhuF09M-lkp@i=
ntel.com/

smatch warnings:
drivers/tty/serial/8250/8250_port.c:3257 serial8250_fifo_wait_for_lsr_thre(=
) warn: inconsistent indenting

vim +3257 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley              2015-06-27  3240 =20
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3241  void serial8250_=
fifo_wait_for_lsr_thre(struct uart_8250_port *up,
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3242  				       struc=
t nbcon_write_context *wctxt,
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3243  				       unsig=
ned int count)
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3244  {
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3245  	unsigned i=
nt i;
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3246 =20
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3247  	for (i =3D =
0; i < count; i++) {
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3248  		/*
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3249  		 * Pass the ow=
nership as quickly as possible to a higher
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3250  		 * priority co=
ntext. Otherwise, its attempt to take over
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3251  		 * the ownersh=
ip might timeout. The new owner will wait
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3252  		 * for UART_LS=
R_THRE before reusing the fifo.
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3253  		 */
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3254                 i=
f (wctxt && !nbcon_can_proceed(wctxt))
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3255                  =
       return;
03dd6d771fb6be Sebastian Andrzej Siewior 2025-02-04  3256 =20
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03 @3257  		if (wait_=
for_lsr(up, UART_LSR_THRE))
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3258  			return;
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3259  	}
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3260  }
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3261  EXPORT_SYMB=
OL_NS_GPL(serial8250_fifo_wait_for_lsr_thre, "SERIAL_8250");
a7b9ce39fbe4ae Ilpo J=C3=A4rvinen             2026-02-03  3262 =20

:::::: The code at line 3257 was first introduced by commit
:::::: a7b9ce39fbe4ae2919fe4f7ac16c293cb6632d30 serial: 8250_dw: Ensure BUS=
Y is deasserted

:::::: TO: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
