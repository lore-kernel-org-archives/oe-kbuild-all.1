Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337611199
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgKqENDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697193591; x=1728729591;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EdUkyxDquqHULFKo1sZtr/htjjNPhFh4HnnBYrB4zq0=;
  b=RgKqENDrjNQ6YiG3Ug3iNPVPOu8eIv2/DiRGPLHt8OrqgdPb0YVVzoXz
   ZBh1SwfnFuMG/cyMp9crdGDmODisXv5jST6suS8VM5W3h+61/L4Ay9hRV
   EzBaD8FPZs4Yp/gcHwiO0OqMY7UYeVn6wtWsOX1hKqvdClA6tu+x4Si7q
   /S0kwzqbSNAoIypwZup6s9HuW/kSqCvU2AAEjCcyzsYiI1vTFCiJ2FYsE
   yMcBFrvH7/18IfePRV/nVS8kuh58xg+zuEV2r6HmuelwKmqQ6dhT6G1vQ
   aewTDEKLvxNhmtbCrZeZBthJzGP2VGbu2Fcrk4mENRQM+kVWE2MPkZANb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388003211"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="388003211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="871022922"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="871022922"
Received: from ttmerile-mobl1.ger.corp.intel.com ([10.249.37.202])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:39:47 -0700
Date: Fri, 13 Oct 2023 13:39:45 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
    Dwaipayan Ray <dwaipayanray1@gmail.com>, 
    Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com, 
    oe-kbuild-all@lists.linux.dev, 
    "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
In-Reply-To: <6ed4cd5ae37a054d4780c8fa519dc83396b15c14.camel@linux.intel.com>
Message-ID: <b93a3e8-2d15-256a-4172-a22ef17dde9@linux.intel.com>
References: <20231012023840.3845703-4-david.e.box@linux.intel.com>  <202310121314.3Xpqom2w-lkp@intel.com> <6ed4cd5ae37a054d4780c8fa519dc83396b15c14.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1029817949-1697193589=:2026"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1029817949-1697193589=:2026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi,

I added checkpatch people, please check what looks a false positive below.

On Thu, 12 Oct 2023, David E. Box wrote:

> On Thu, 2023-10-12 at 13:25 +0800, kernel test robot wrote:
> > Hi David,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]
> > 
> > url:   
> > https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231012-104217
> > base:   acce85a7dd28eac3858d44230f4c65985d0f271c
> > patch link:   
> > https://lore.kernel.org/r/20231012023840.3845703-4-david.e.box%40linux.intel.com
> > patch subject: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
> > reproduce:
> > (https://download.01.org/0day-ci/archive/20231012/202310121314.3Xpqom2w-lkp@in
> > tel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version
> > of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202310121314.3Xpqom2w-lkp@intel.com/
> > 
> > # many are suggestions rather than must-fix
> > 
> > ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
> > #31: FILE: drivers/platform/x86/intel/vsec.c:159:
> > +       struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
> 
> These looks like false positives.

I agree. If I interpret the error message right checkpatch seems to think
that's a multiplication which is not the case here.

-- 
 i.

--8323329-1029817949-1697193589=:2026--
