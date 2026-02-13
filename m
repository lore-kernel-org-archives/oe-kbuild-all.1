Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1F224AF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010449; cv=none; b=KPGM5wUahXdpFu0y8a5Xd/8YYv8s7NobO4bcu2v1eYc9TVrfLY0uBUzvXr4mtOYqBj3pV00r4uqfL4Y1e+3+g0eiM+5y0El98d2pbttFng64CVYLpwfMNsFaaCJ2HPj6/yHuI4ffOCvWz7b0RDpby/AG69MIEnNi5uhh3eR04bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010449; c=relaxed/simple;
	bh=MxvLi+RBqhBDzPL+AdRohVzQETByofgQO617rangqK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmzYq3oHBzAdMIabcRJWNjZjHQMDQFpE8kyZp3fD6Em2rbsGB+GejxZ8kTFngChFvnQ8Y82PHuuIlqqd6XUAHeQTU76nout8mcNp5rnunZ31TuMOtPv3bQvHN6zzM9QnCUpLga97ZgSC3u8Atbda6oc1aJEleyl5FM8cE7XGYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=GpVllVc5; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="GpVllVc5"
Received: from [IPV6:2a02:842a:8223:5500::20] (unknown [IPv6:2a02:842a:8223:5500::20])
	(Authenticated sender: julien.robin28@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id A36D613F8B8;
	Fri, 13 Feb 2026 20:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1771010445;
	bh=MxvLi+RBqhBDzPL+AdRohVzQETByofgQO617rangqK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GpVllVc5gzxIgvia3k/OwVIC8fGGK/U2Gy3hQ/XYIMeOtUCfMtg4mLDT8zCHlGB8O
	 VHX5moU34JcbsUwQM4fFKQuXIa0N2z8T3ajAvAM2DtV4w7C1EpnbElQKgpyqtQfh6h
	 IRYU9qoKb/Agu6fOoyfCEHrdhaPvUqLz+QR+VTbuqcxsdV46tf0daiKzc5VEm5hcJm
	 x5AGBo3zsHjiIZ1uiEq8/R8+b9uS/mE1XoT/KF4pj2WY6Z22Hl9MuhuFqt4S4kCVVt
	 a1r5pRGEHlBy8I788I+2bn2az4T5omGS9lcMTrsgXhtAGXGdXVy2Kt1dTUaqwlYq06
	 dTDdQaXMcMvmA==
Message-ID: <1bab812c-59c9-4d99-b91b-ed5bc618ec36@free.fr>
Date: Fri, 13 Feb 2026 20:20:36 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pci-dma: swiotlb: Fix a regression since 5.19.0 about
 iommu=soft kernel parameter
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <16c95f65-17ee-4bbd-99b3-93406a7801c4@free.fr>
 <202602132218.jy0N4aRs-lkp@intel.com>
Content-Language: en-US
From: Julien ROBIN <julien.robin28@free.fr>
In-Reply-To: <202602132218.jy0N4aRs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi kernel test robot and other folks,

Yes, my mistake, 'x86_soft_iommu_only' should have been static; I did the mistake by doing like what I saw around (but the new variable isn't used outside of its 'pci-dma.c' file). Sorry for having done this mistake in a so small patch.

I'll be sending a corrected version of this patch quickly.

Best regards,
Julien ROBIN


On 13/02/2026 3:51 PM, kernel test robot wrote:
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> [...]
> 
> sparse warnings: (new ones prefixed by >>)
>>> arch/x86/kernel/pci-dma.c:37:5: sparse: sparse: symbol 'x86_soft_iommu_only' was not declared. Should it be static?
