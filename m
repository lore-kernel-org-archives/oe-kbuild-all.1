Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C569D3B290
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714173617; cv=none; b=N+ddR6UZXauBdGn90K1iWcXYxJP7391CCpTN/KRA0Vcfrektf9mEXBkWMfYJ0PsoBa2rV+KezqCLFVfAefetUd3P82/xjXdyzS4hf44ok9cs7Uj021tpC28EMMJTMP0ufWjMUVBdnpb8/i7XwHputnWyXsjaJNgQgbtF2NBzQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714173617; c=relaxed/simple;
	bh=er3l2+2awIfIht3BVGvjcw7jAVWM3vuQZudlLbgPUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uRFk8/blYLD7jr7lW16SHKTtQjp4mCbV1ZaQ+d3hxecD83+dK6jR9Skq3dhuwhDbsC7sHJN36CVnsfPn1YYgPyrF4rRNfZmIOa5i0UUttAa6V0KC68XNDdFDezC1/DkmhUmHYCkcR0qXzVZkcwOfzyG9PZpQpVlNABDZHeuGvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB5vSs1C; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB5vSs1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714173616; x=1745709616;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=er3l2+2awIfIht3BVGvjcw7jAVWM3vuQZudlLbgPUIo=;
  b=MB5vSs1C9ChU1vb2VMorq77pPmRPt8lodBZHH/8KPdWrXgabtPru5BYC
   JuNO2xHWB58tiO3bvm0k8VYYEmLsGG3Wk53Yc3Mv50t3i4jrfrfsUt0fY
   fc4p4B9qw5Rzb1Wll23OHfYxybcxQGdpdZjaZz+HPG86dDqZ4EkjFsoXV
   sdjJPuZiSACoF0Qj1JGIO6doCEUjtA65sASLYByU39LJwnJURc0tZtL6H
   6Bj5HMRO1liobOrgcjlLQ4C2ydeRT/e1Uy+GDMkEwm9wZ9mEanchp2w1c
   82fbNElUwn6AtGUOKH22b+qHRVeGvu5MnIdZ5+ajIQXlfU0Its78+1ftm
   g==;
X-CSE-ConnectionGUID: TFFLUIaaQeCmEuvTuwP4wg==
X-CSE-MsgGUID: xCEu+LVxRP2yHlyoKsTFxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10044979"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10044979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 16:20:15 -0700
X-CSE-ConnectionGUID: Dvx4qwW7ToSbZiKXP7RdEQ==
X-CSE-MsgGUID: Hd5K7yUKTXKi9d+X1Rn/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30010228"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Apr 2024 16:20:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0UrU-0004PS-0A;
	Fri, 26 Apr 2024 23:20:12 +0000
Date: Sat, 27 Apr 2024 07:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs: stable-kernel-rules: fix typo sent->send
Message-ID: <Ziw2obDI0qdf2GzQ@dfcf791b8290>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA3PR13MB63726A746C847D7C0919C25BFD162@SA3PR13MB6372.namprd13.prod.outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] docs: stable-kernel-rules: fix typo sent->send
Link: https://lore.kernel.org/stable/SA3PR13MB63726A746C847D7C0919C25BFD162%40SA3PR13MB6372.namprd13.prod.outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



