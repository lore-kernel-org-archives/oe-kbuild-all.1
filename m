Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383113418E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBliOuIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697131395; x=1728667395;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xdt5/Au8+P8aciApF5KRE4r7URgA+4e3oS7ZjhG6eHQ=;
  b=aBliOuIxphFr2I8Jy1QIV608x5yLAGJaNtSITUmIzDikkuexurQL0jw9
   omZdVefjwiapqTnAipXaDoRFBO8tyAwVTbB7VvgMudYsVwD8opbXkZ1Cf
   T/QBZZ8+MRHZ7XLXuV0kncOtJIviduP4lIRN0aPLYVq4uF66RKAotNkrt
   a7+DDJFxKmr8HWquP5qI1x/9+6PBk6YdIoZ1zwycUChi2WLJcdGY0IbjI
   GrQ4cqR1HyHwyUSkE9r2FQj5u7LwlaiOP9aGHz2SZpBY7X/oqq/jCT2Ca
   Bi3nRJ6/p7rz4J8Dmr7Bqst2vTfl9Pc4kmFpOXSuphklZInIeEqBvNNJ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365247171"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365247171"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 10:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870677425"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="870677425"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 10:23:13 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
	by linux.intel.com (Postfix) with ESMTP id C355C580919;
	Thu, 12 Oct 2023 10:23:13 -0700 (PDT)
Message-ID: <6ed4cd5ae37a054d4780c8fa519dc83396b15c14.camel@linux.intel.com>
Subject: Re: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	rajvi.jingar@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Date: Thu, 12 Oct 2023 10:23:13 -0700
In-Reply-To: <202310121314.3Xpqom2w-lkp@intel.com>
References: <20231012023840.3845703-4-david.e.box@linux.intel.com>
	 <202310121314.3Xpqom2w-lkp@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-10-12 at 13:25 +0800, kernel test robot wrote:
> Hi David,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-i=
ntel-vsec-Move-structures-to-header/20231012-104217
> base:=C2=A0=C2=A0 acce85a7dd28eac3858d44230f4c65985d0f271c
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20231012023840.3845703-4-david.e.box%40linux.in=
tel.com
> patch subject: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
> reproduce:
> (https://download.01.org/0day-ci/archive/20231012/202310121314.3Xpqom2w-l=
kp@in
> tel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion
> of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202310121314.3Xpqom2w-lkp@intel.c=
om/
>=20
> # many are suggestions rather than must-fix
>=20
> ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
> #31: FILE: drivers/platform/x86/intel/vsec.c:159:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_vsec_device __fre=
e(kfree) *intel_vsec_dev =3D NULL;

These looks like false positives.

David

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>=20

