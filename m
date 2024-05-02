Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4B57301
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714656227; cv=none; b=fdQVUN9eOmHN7g4LBMuEp6+pFdRfEHTdiJ3gOXZmT6MBmQbT02+P+EIOG9BDIx0sNYbH+t+9NoH51/hecnvnTrCpcttA5yT1WSYCqNiAz+Z3kvCMh+jeJVmOwXS5CapopGvfDnWvOyH5g7rW99ikFvAhsBuHT0kMkHbwy8XaEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714656227; c=relaxed/simple;
	bh=t4XsFHmrsF44ZClX+cIdDUB/fa+zvnz3fYN9t24QKpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fLVgAMKiW3d6z3a293vZUT5th/4K+938G4oyw9Yj9d/2SjKfhk9nqVwNOTauexsqgzYGyrUA1eGHMJ7EDhPVL8IuZI2g8CIZJqfyWxnv5Vo8E1wLKgYg9j95Esuiv23jK/aN8A2qyMZWCXU5/KJ64IwVgD1zdM27Fz1kKWaidU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=UkiMcbXh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="UkiMcbXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714656221;
	bh=3yP/pzQtESBILyvNR+5Nu71/NLNrgKSAAJ7uTOxXLJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UkiMcbXhuMHBypITkrqDZ1LiM4W+vRBJkuxHcUpFjC5i/ITVWG9X7QG02Z+7ZOnxA
	 Bh7/r8zx9cM+SN1ytG5ucuBnZEJTyLtbfydMdkFZyLQB2aiVbJy/4K9E5TH21pTzzP
	 LPE6tyLprXiw0LmLLQaMl8owooyXijfJln5V279qWvhlhFOS4T8HTKUdzjrTnQccEc
	 Hs/DPkKfhdBPp7knZc6NJ3SyDH9nKlPPT/o5AIBR2diUMYvND+gt1ym/miam7vpSxS
	 Pz+SBs3G/FCtBhwZPnv8tl5/BDrDOfmGeUbotC8Kh8yRRDvYhXILfvajzMqIcnqKGR
	 tsoZq8EoSl01w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VVZQ453lfz4wc7;
	Thu,  2 May 2024 23:23:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, kernel test robot
 <lkp@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7646/8170]
 arch/powerpc/kexec/crash.c:488:2-8: WARNING: NULL check before some
 freeing functions is not needed.
In-Reply-To: <9c14d5bc-ffb2-4ddd-a5f1-5d419e88b187@linux.ibm.com>
References: <202404261048.skfV5DDB-lkp@intel.com>
 <9c14d5bc-ffb2-4ddd-a5f1-5d419e88b187@linux.ibm.com>
Date: Thu, 02 May 2024 23:23:39 +1000
Message-ID: <87o79o2vqc.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> Hello Michael and Stephen,
>
> I fixed the below build warning in v19:
>
> v19 patch series link: 
> https://lore.kernel.org/all/20240426060728.559753-1-sourabhjain@linux.ibm.com/
>
> Only 6/6 patch has been adjusted; all other patches remain unchanged.

I don't want to rebase the branch just for that tiny change.

If you want to fix it, send an incremental patch on top of v18.

cheers
