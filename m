Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AA32A1CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952863; cv=none; b=tROwPJNS52361/T/0giExKtO5RALArC5+WtsEy5I4HkmTMLL9+GjlzrCbbuvhTb/PM+zevFkNJfvc+h7ne8wKSfzp4zEqokdeW/YwcDxKRuGg+2+NE1zL1aK9WknWEMWvJPGQyHR3gD6EWOYfKShojpNdmRyLxXplZ+nDfv5+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952863; c=relaxed/simple;
	bh=UCdY04ZMgpn5WUuJacaJ2RPGhxuerxAWgsB/MdcYWNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5rOenbQDrXz5/XrMXJM5dIz8LM/1nfPaWf0xBU4oULKccQMjC9KaE40U+fgBmvBJbM368xeKwvfy9Jryfk4KSwdTBxSLD1PVP1KP4y9UuKZQHCjKfhWiilq4btKL3jD0wbzGcWsHYohWXdNgaxyb2fYM2VZjRCE2OGaQYXLYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F47F1063;
	Mon, 20 Oct 2025 02:34:13 -0700 (PDT)
Received: from [10.1.30.161] (unknown [10.1.30.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A7E83F66E;
	Mon, 20 Oct 2025 02:34:20 -0700 (PDT)
Message-ID: <f3524b4c-f271-40ac-9038-c38c0bd07901@arm.com>
Date: Mon, 20 Oct 2025 10:34:18 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16-6.17 2/2] arm64: errata: Apply workarounds for
 Neoverse-V3AE
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
References: <aPYBJGWKS1hS5NFF@ff1a9926167f>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aPYBJGWKS1hS5NFF@ff1a9926167f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2025 10:30, kernel test robot wrote:
> Hi,
> 
> Thanks for your patch.
> 
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3
> 
> Rule: The upstream commit ID must be specified with a separate line above the commit text.
> Subject: [PATCH 6.16-6.17 2/2] arm64: errata: Apply workarounds for Neoverse-V3AE
> Link: https://lore.kernel.org/stable/20251020092741.592431-3-ryan.roberts%40arm.com
> 
> Please ignore this mail if the patch is not relevant for upstream.
> 

Ugh, I re-backported this verion from mainline and forgot to re-add the extras
to the commit log. I'll resend the 6.16-617 series. Sorry about that...

