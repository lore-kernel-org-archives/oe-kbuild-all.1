Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F433B97B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971823; cv=none; b=F44ximRJdjSKrPwho7PeJtOGu31chMFUZ+BYMZcWIg3PCFtJCAcubZ2GOgfA7PRiyuI/+sCRtchKBya7HNnYjP2xlpkrzxV2Sw3Iexdx0wXMeOqeMsGe2d9kyxbjJd1xZcHQGyzl4NW8o65OdJqXFWuuqwSk9+TefegzbuTRLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971823; c=relaxed/simple;
	bh=7uB/PCia4RZYSoP+w0qDkGwAGbztPcn3sFxeOvnNZbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZEgkaMC6kFn068pdTkMLhXpfD0V3FD2orpzlt097PsZO9Ciqi5Sl6AYI48AZd2HrEl1xKPyhjbo1oQj5S9ACPY3pTNuZFAXi8ZpnjtciKIAngPl7j9AD6ISNXO+wiFkT1snR+MjWGl/CqwDu+kZrzp9BYQrGHCwxj76PxBz8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RgQhA443; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RgQhA443"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770971819;
	bh=7uB/PCia4RZYSoP+w0qDkGwAGbztPcn3sFxeOvnNZbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RgQhA443+n+xY7wQbgDPJuhPVdwDk/1kDyOV7xHjv+mwn9DHyyQPTt1uSMX3mGDNp
	 rC9XEwjElVtEzvZAX1GUcQGm1lnPtsxT9i4RhB/qcekDUW4qgOp64OfQj26HqqdUPQ
	 u2um8l1nNQjjPWYTwfMl6tD8HavSLyD5S3kS3GFATWnwWfblsePY49BmYpsBWoe52U
	 LloeNPG1lJ4Z7IiJBhtRdJ7pJfouAFfgLyHMWPaICTTpt/67up8QGiTa55ir9qduUh
	 NgVi/oNVLM9JTUpsWfiSQligU/Kvq1AeiRe8Mtaff7Ru0rJvqENnm05gL2SLAKQqgw
	 vJANkKp1HfcqA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D5CB17E151C;
	Fri, 13 Feb 2026 09:36:59 +0100 (CET)
Message-ID: <1fc9e105-6c2b-4e4d-9e29-9284cfd76545@collabora.com>
Date: Fri, 13 Feb 2026 09:36:58 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk"
 [drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <202602130253.BZnVd4jh-lkp@intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <202602130253.BZnVd4jh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 2/12/26 19:11, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   37a93dd5c49b5fda807fd204edf2547c3493319c
> commit: 355a110040665e439af126e8ec9c3968e73f163c media: synopsys: add driver for the designware mipi csi-2 receiver
> date:   3 weeks ago
> config: i386-randconfig-062-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130253.BZnVd4jh-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130253.BZnVd4jh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602130253.BZnVd4jh-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk" [drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!
> 

I'll send a patch that selects GENERIC_PHY_MIPI_DPHY in the Kconfig,
this should sort this out.

Best regards,
Michael

