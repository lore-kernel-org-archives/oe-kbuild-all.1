Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54BF257423
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316134; cv=none; b=X5Jv5oEx4ouiJ5rnrVss6JAQ37VC7Md55OLBQSDKSDbXuf9RlaBgj5cDVBn+hjlxfo4/yFbEnVB51P/qRHAtKn51sQOmNbe2roN6Nnl6uDSisxA+Un8hcON9wouFxzCOBmnvw0Pqo2DVOtXhIqBvU/i1Mut5Lm4FK52o/X2UjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316134; c=relaxed/simple;
	bh=aEgmasF5tl8h5mTdPB5Q3OoDrQGakdNTKNRIWj2H/L0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DyM5g4SkZKJ1murIRK5AGiUqIUTmaKMlT7vFV8qrEyndxFnaJd/3xBRMmixZIaLcDiIZfiyc6Cba/yelQPDlnYJglcUVi83BA+n30c/PFmIytvaPLJDVpZnZPdjF4/LBJEk4uMyJ/tPrTl0vOXHMdJ95E2MKpBMKH1PvMc3xBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/NhQVGu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/NhQVGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316133; x=1799852133;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aEgmasF5tl8h5mTdPB5Q3OoDrQGakdNTKNRIWj2H/L0=;
  b=H/NhQVGuqbZs65rUT3JGag4vZfEJqAM/7/jof51fTvRxfYvNhp7GgSPS
   VzJBsRpuLkC7SMGiVek5SE2UENbJOKkmADqi8bkeFTYr4dk06PKLHeGJ4
   OnLsLicDT6dntuClUK0r/DdVKF70LX33tmS+4mYj3IJEoQamqsV2vlxVA
   Pxj5F6RE2O7Z6k8tZGbUot0VldOrbwBfW07vpb3Lpg7uyF0hIaPwKUU+j
   V63lIPzz83eV9RYMYPmt4g5Dazc/unmgJGDFDkyu0a995tJ0uzmFHq0sh
   b5WFFSjOA/d5sz/3kSF7KTPIHY+bMLZH1ka3hZ/pX8Z1FGifAD5rBR4MZ
   Q==;
X-CSE-ConnectionGUID: zOE+GGfZTcKUQZBWLqa9Cg==
X-CSE-MsgGUID: gIzPFokFQJWczZUrr1PZog==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57157110"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="57157110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:55:32 -0800
X-CSE-ConnectionGUID: mPzGiB8dRJy3q0aV5UKYIQ==
X-CSE-MsgGUID: dflp1dvKQKSa5S09/h4ZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204292036"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:55:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Jan 2026 16:55:26 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 8/28]
 drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static assertion
 failed: "ARCH_KMALLOC_MINALIGN >= 8"
In-Reply-To: <63a1bb66-e2b3-4521-8de8-0e7ee0ff6013@gmx.de>
Message-ID: <6a8e58c3-0eed-2921-9da9-69ea315f7540@linux.intel.com>
References: <202601131514.lmN2k3pc-lkp@intel.com> <21b70177-d06f-4bb8-9c11-8f3b053cef9a@gmx.de> <63a1bb66-e2b3-4521-8de8-0e7ee0ff6013@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-289952177-1768316126=:966"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-289952177-1768316126=:966
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Jan 2026, Armin Wolf wrote:
> Am 13.01.26 um 15:16 schrieb Armin Wolf:
> > Am 13.01.26 um 07:52 schrieb kernel test robot:
> >=20
> > > tree:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driver=
s-x86.git
> > > review-ilpo-next
> > > head:=C2=A0=C2=A0 2511dd4dbb76ef6914c9b45ccba2492da25d772d
> > > commit: bfa284e9f5e77c9e7389116a403b1dc478f2d58e [8/28] platform/wmi:
> > > Introduce marshalling support
> > > config: i386-randconfig-062-20260113
> > > (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3=
pc-lkp@intel.com/config)
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > reproduce (this is a W=3D1 build):
> > > (https://download.01.org/0day-ci/archive/20260113/202601131514.lmN2k3=
pc-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202601131514.lmN2k3pc-lkp@intel=
=2Ecom/
> > >=20
> > > sparse warnings: (new ones prefixed by >>)
> > > > > drivers/platform/wmi/marshalling.c:24:1: sparse: sparse: static
> > > > > assertion failed: "ARCH_KMALLOC_MINALIGN >=3D 8"
> >=20
> > It seems that i forgot that on 32-bit architectures, u64 (aka unsigned =
long
> > long) only has an alignment of 4 bytes.
> > Would it be safe to instead only guarantee that the buffer is aligned
> > according to ARCH_KMALLOC_ALIGN and that 64-bit
> > integers need __aligned(8)?
> >=20
> > I do not know if aligning a 64-bit integer on a 8 byte boundary is
> > compatible on 32-bit with a buffer aligned on a
> > 4-byte boundary.
> >=20
> > Or is there a ways to tell kmalloc about such alignment requirements?
> >=20
> > Thanks,
> > Armin Wolf
> >=20
> I think i found a solution for this: kmalloc() already guarantees that ea=
ch
> allocation is naturally aligned, so 64-bit integers
> are already aligned on a 8-byte boundary by kmalloc(). Because of this i =
think
> we can drop this static assert statement if we
> reword the WMI driver documentation a bit.

Yes, kmalloc() does guarantee > ARCH_KMALLOC_MINALIGN in some conditions.
You probably read this already, but here it is for the record:

"The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN=
=20
bytes. For size of power of two bytes, the alignment is also guaranteed to=
=20
be at least to the size. For other sizes, the alignment is guaranteed to=20
be at least the largest power-of-two divisor of size."

So effectively, if size has run of zeros in the least significant bits=20
beyond ARCH_KMALLOC_MINALIGN, that will become the minimum alignment.

> Should i send a separate patch or should i resend the whole series?

I already dropped this series to avoid head-of-line blocking=20
the review-ilpo-next branch (but was still looking for what to reply to=20
your alignment question). So please resend.

--
 i.
--8323328-289952177-1768316126=:966--
