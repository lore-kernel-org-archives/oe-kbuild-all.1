Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEA1FE475
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348816; cv=none; b=QlwIaoucHJyWkFeTfwoxuLP7I0+I5P6jLNBpgy9GmzkLsexGl1/PHMb02LZFy9VYK3iJawz6TTy9Pn31ENdsTII4dun8rl9snjsIJ7j1/NBfjpRfJm7RYUWibuU5tO/TaLu10OSiuz9P27NenSFOSWeljIRlEHLmMfnVZ7vdozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348816; c=relaxed/simple;
	bh=RaEe/XFKMDCSA7aBqzeyuP7sNcXB8aS28GT3lgFZCPY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwNboX3150JyWIMbX/VMt+2Td425tKfToDHxXLY1dZC22RnYrmnHBo1G5+w9H6pBQVeDFcqlEULSoaoiY6btqX07BI+c7SRmWffXn2/DrvVQ/rpVLlflToK/qdUUlb7iVmm5UDBGfKB2wVCsdJPrz39Q6dOCUrGigll/3LvP3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xxx8gYe6; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xxx8gYe6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5086Z1v0010495;
	Wed, 8 Jan 2025 09:06:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zamDIBjvi5clVSbNtP
	xdUuZy9UUD/REfDiaZSqQYbFI=; b=Xxx8gYe6WOsLv8yEPw2EPb/C24/dOKT4Vi
	CW+ANnNe4gAeviEjrIB6CyMrxVGNn4/AFYaIOR+xMT4094JvfnFbxpUko4L5zcwy
	Nntcc0HF0VrTjIc226BSeyuB7S6xVlkaKV/lc+X0AT5epv44nAeTNRpCL9dGW1Dw
	POIhorlJWSlQ6wO6oRXQWm2d+XuEeg5b2B694ilw0CblDv81Q5WTz96T+dOuXOMc
	d3BJc7EhEFFd04HvekZ9HEvxOHS4yPYtQ6q1SbgxqxjP2pffImJ00xrwPnwFlygT
	+RuH/XgbxaMA7/Fbg73sMbmyZw4AVCqOB1j2gBxCIQNxjMa4H13A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kctdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 09:06:48 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 8 Jan
 2025 15:06:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 8 Jan 2025 15:06:47 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 48C4C820248;
	Wed,  8 Jan 2025 15:06:47 +0000 (UTC)
Date: Wed, 8 Jan 2025 15:06:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
CC: Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran
	<fazilyildiran@gmail.com>,
        <oe-kbuild-all@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>
Subject: Re: [linux-next:master 6614/7110] kismet: WARNING: unmet direct
 dependencies detected for MFD_WM8994 when selected by
 SND_SOC_SAMSUNG_MIDAS_WM1811
Message-ID: <Z36UhqOQEAYmmPID@opensource.cirrus.com>
References: <202501082159.zxUt6Gfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501082159.zxUt6Gfj-lkp@intel.com>
X-Proofpoint-ORIG-GUID: H1M1JipxG5ahxWF4M783aR1HPc24-w3K
X-Proofpoint-GUID: H1M1JipxG5ahxWF4M783aR1HPc24-w3K
X-Proofpoint-Spam-Reason: safe

On Wed, Jan 08, 2025 at 09:54:38PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
> commit: fd55c6065bec5268740e944a1800e6fad00974d9 [6614/7110] ASoC: samsung: Add missing selects for MFD_WM8994
> config: alpha-kismet-CONFIG_MFD_WM8994-CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811-0-0 (https://download.01.org/0day-ci/archive/20250108/202501082159.zxUt6Gfj-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250108/202501082159.zxUt6Gfj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501082159.zxUt6Gfj-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for MFD_WM8994 when selected by SND_SOC_SAMSUNG_MIDAS_WM1811
>    WARNING: unmet direct dependencies detected for MFD_WM8994
>      Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
>      Selected by [y]:
>      - SND_SOC_SAMSUNG_MIDAS_WM1811 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && IIO [=y]

This should also be fixed by my patch to fix the ARIES issue:

https://lore.kernel.org/linux-sound/20250108134828.246570-1-ckeepax@opensource.cirrus.com/T/#u

Thanks,
Charles
