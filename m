Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB237E5C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 05:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786079397; cv=none; b=g/7YF5OQdlbQokmw/ciWpe7Pi91kmB9MPfTp7qd7GwniW8Yy8XJYUqZfbB9ejcJ6kGyV2OMhW7L7aTqZ3DTCR0BaP3eGnqJCx1ry/PQJiWrGMjf+ZMfkdpv/chTwAeCqRJnDRNJGFLxgsTJJZFuRe3aep+KT+3Nuj85TsdUTnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786079397; c=relaxed/simple;
	bh=bm63kvHwN4+e6sorVIAytxVgVfggcFnaeu/2Rn52isk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4wwOHu1bNT8sS2jFWP6tgbyUj3rJ4U7vMtqHM9N+HOw5754nUOIC0FO8/3GgtDiY3mfROJz5grsRIDJsWqYWwvdgoD8LfUqK3mjOMMT5AmmOprGS/OiMHdAzEgzzSTRUtG8hFkjG9jxF4a9ted0yoQXV1Fr6iMYZas/+WAsxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxCIs2ns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxCIs2ns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635891F000E9;
	Fri,  7 Aug 2026 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786079384;
	bh=qLFQLnfAYQNTSLWVfPZ5yI1uLuKWvTDQ+2e134RvCM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MxCIs2ns4himibB3cFiREoNn8amblAtrDJA8rCk8p1pqhUc7lrBYIyMWU3Cc9pgOH
	 ihYUMb8XnzFAZuD5/6GdyFAMCXy6tKKILim1Cq15MfQHascc1E1XXcruUgH0BZUt5L
	 wLCduEH5Ow2Yp51JC3UTRcI8gGNqSEW80cK7WvLJXXa+wC+5L1MrfOKAXUIkXVF2OF
	 6XSkaewFGFOGQE1PsjQamHXBWuL4I2uLbYQVzQ4FhRshLKMSGlQu4/rU3+Fx+EGwl0
	 ON2Hdor/ucLQE5WwuBtpsVVDNuiVKPaZ8sJfLuK2XrVmKglqrRXmbMgR1nt3qgccNP
	 eZrXQx1iXT2dw==
Message-ID: <9434da92-0b42-42b8-a9e3-d0329ba76032@kernel.org>
Date: Fri, 7 Aug 2026 07:09:40 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8973/12727] drivers/soc/fsl/qe/gpio.c:43:34:
 sparse: sparse: incorrect type in assignment (different base types)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202608051952.ADkLIB86-lkp@intel.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <202608051952.ADkLIB86-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/08/2026 à 13:55, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
> commit: 21d055109b2352542ac293872ca9113b42b6c55e [8973/12727] powerpc: Move CONFIG_QE_GPIO to SoC
> config: arc-randconfig-r132-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051952.ADkLIB86-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051952.ADkLIB86-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608051952.ADkLIB86-lkp@intel.com/

This problem predates this commit and should we fixed in a follow-up patch.

Christophe

