Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E671A7AFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562892; cv=none; b=mEL4wdHvR+MViXESeC7pZ6a3Tj1DayGRjbNO8JtPouwTtckvJbkqD9zJOsXYXNWXcsruRLXkADeazpTEGt4drrbDKYqAWBgR9krZnT/KU+TyGVZjbDfVbKB8YASnmPHN3x741NWAZ2AoZmCd8P7t75dU9fv5diFuNk2ybtDARYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562892; c=relaxed/simple;
	bh=hzSHOhS+CR4wf/6iYboVwI85TNiqxB0RCiiX8rHqUeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXMJcQWZ8ao72n7THvDBwWgZSEj6HoWRMb1GPUiK8UXIIwiqlnAtvZQemUUPiXpxHTp68YGz62J3hdo/yA/QDfLY/QR4DNs7demo/QtwlknnDItN5rK7sYyyADMt/kEPy92bXj5XCxihurltLsi0v4mmp2zxFH8Cv8t4e2pwQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LJ3U15D/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LJ3U15D/"
DKIM-Signature: a=rsa-sha256; b=LJ3U15D/2yMzEgMKGcG5F9qGEWHzPEAicHW5iz9qgIEQ4nbPzTHBp8j1rDE4OFcr4hchntIxsUGlczxd0SSchbW7nDIIfBFqKDqoM1w915NdUbpP3BRFOvaZnioGYUyTs5AGEGF8rBR+1kU9UNErf24SzNZ/TXJuYIOW3512FrDx7dBMEOPyZZWKssNU+XtOv6ayOKJKrtNC72ImhpRjJGTnNBUP/dwT0lPqnwkCFxHGwwqrg5QbmRHkx8nCFTBNPqq4RbAm3f7RRZ5QTCxvbTOluMQ2HhGTr4B3t8yB+ltytHm65zSLvJbROck9p3lnpIh+iLqoVEvskZlUGsiVag==; s=purelymail2; d=purelymail.com; v=1; bh=hzSHOhS+CR4wf/6iYboVwI85TNiqxB0RCiiX8rHqUeY=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -879821645;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 30 Dec 2024 12:47:50 +0000 (UTC)
Date: Mon, 30 Dec 2024 13:47:48 +0100
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [krzk:next/dt64 21/21]
 arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error:
 'dt-bindings/clock/samsung,exynos990.h' file not found
Message-ID: <Z3KWdMqz_HKgYW3Q@debian>
References: <202412300233.Ey9SD8JJ-lkp@intel.com>
 <8065b144-4d4c-4055-aa5f-e71897468464@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8065b144-4d4c-4055-aa5f-e71897468464@kernel.org>

On Mon, Dec 30, 2024 at 08:25:34AM +0100, Krzysztof Kozlowski wrote:
> On 29/12/2024 19:51, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
> > head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
> > commit: f21231ac28f44cd5daf50bc8fdae381f451b46c9 [21/21] arm64: dts: exynos990: Add clock management unit nodes
> > config: arm64-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > dtschema version: 2024.12.dev5+gea243eb
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412300233.Ey9SD8JJ-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:
> >>> arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: 'dt-bindings/clock/samsung,exynos990.h' file not found
> >    #include <dt-bindings/clock/samsung,exynos990.h>
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    1 error generated.
> > 
> 
> So this wasn't built (no dependency mentioned in the commit changelog).
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Really sorry for this. This patch obviously depends on the previous CMU
driver patch. If you would like, you can drop this change and I can resend
with the dependency in the commit letter. If not, I will just keep this
in mind for my next patches.

Best regards
Igor
