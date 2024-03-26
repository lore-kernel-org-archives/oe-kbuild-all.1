Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84A482EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 10:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711450395; cv=none; b=Eh2gEi3jeKeodTIf4zAvHEfob0a3Z6Ig8IroJhEmkEt0XgAmsyrADSEOPnjoQ+daqng/OaTDdv2V9Om0DD7of9sc+dsgPK7gwRHlByEFXzgJzlSHPqWHVtKkbSGQznglXxuUZF54yWYx35RjUcfuyVPxAlqv7kSF6bS9WM0pusg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711450395; c=relaxed/simple;
	bh=G1koI1iBQTJ4grlw0wBtVnNB6H4BQ7AVJ+l8CiGmxi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTIqq/YvVwkpjK+N9u9m/G31aMi/QF03nMbOidc/BKDT2HSaoGE17gAUHV6EAhYfUVoBgMstkWzQL5TvH6RgVIUCphfHepphWRvWjKrtBEmFCa9kwqN58cOFXLcoS/qOht2grYRUSHEQbYc7OINwP5667nt9b9fN+HtxahUK6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=L9D34bI5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="L9D34bI5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D331A40E02A2;
	Tue, 26 Mar 2024 10:53:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T4pXNArnRqY3; Tue, 26 Mar 2024 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1711450387; bh=VCidKdh5/CkIzWvzvJJ7kKF4dJ3wX7736ijWd3jjOBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9D34bI5jjrYqbQJGNDKeI8rtA7bFMdXWa4BZqr2bK/ieW+8QpWHA27vcLuGgmKad
	 v1D2jMD2HOy8QH7YvGoqGQP/J7Y+hB6S2d5zumWW9S+BzHx/PdLtHqvQ/8kQWyHzTj
	 rG90A4Hgo7YM/nYU9TqNgmbgI1kg8w4jikNHnxFaMkKZJjzisn6w1g/jy8hqTOVegP
	 Cm4Koe2wWKl/LwtHmk8Z+4JJ5MrXcJAiPXFyzvNLV/Kuo303IQl5mh2mQeL9njb/PC
	 m1tBI8oJtGUntKM6kyzhpud60mJr5nFMNLIKcjQZFpgE0dvH1bvYjMlcYqHJH7nPyj
	 gDBOjVbxrmJVsnAdYVczHBjKd464w7cIKnJh3oxOHdOBJmWB0x5VNY6OYkYtQjps8P
	 zjabgMN6gOQ/oqMIuYtfsuEVyy8op/6Iwt+S/7FpnbYJspTqLddvNo2bgqz1xBu1Qr
	 tS6YuWdFwMeALjRIAPLkv8yMoI6ymRSI3yfSag0ek5KHzswsf8Hrp30qzSKw/ChFc9
	 0yBNhccUIK7F77pAaFvU41E/DK52DP8+Ijwce+Bluo/opgAxJtLJhcAk6qwnh3dvL6
	 s1cGF5kmP2KvtaI5zn8HPbtWTTs/fvFJBSh3wFjqE+QYUzydxPraMwpiPMGCOtIBJm
	 Yh9dixhq2EPNRTI3rs8LwKCc=
Received: from zn.tnic (p5de8ecf7.dip0.t-ipconnect.de [93.232.236.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C3E1740E00B2;
	Tue, 26 Mar 2024 10:53:05 +0000 (UTC)
Date: Tue, 26 Mar 2024 11:53:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [bp:rc1-snp 4/5] arch/x86/coco/core.c:22:3: sparse: sparse:
 symbol 'cc_flags' was not declared. Should it be static?
Message-ID: <20240326105304.GCZgKpEJQ3dFouKRHh@fat_crate.local>
References: <202403261310.vQmXYKzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202403261310.vQmXYKzL-lkp@intel.com>

On Tue, Mar 26, 2024 at 01:50:02PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git rc1-snp
> head:   e4ebc402b2c134524c0f8564a385e6f6613ad34e
> commit: 8ea03a1dd663ccedd7e684e01061452f29826514 [4/5] x86/cc: Add cc_platform_set/_clear() helpers
> config: x86_64-randconfig-123-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261310.vQmXYKzL-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261310.vQmXYKzL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403261310.vQmXYKzL-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/coco/core.c:22:3: sparse: sparse: symbol 'cc_flags' was not declared. Should it be static?
> 
> vim +/cc_flags +22 arch/x86/coco/core.c
> 
>     18	
>     19	struct cc_attr_flags {
>     20		__u64 host_sev_snp	: 1,
>     21		      __resv		: 63;
>   > 22	} cc_flags;
>     23	
> 
> -- 

Fixed.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
