Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75D13C81B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721771121; cv=none; b=XgNXbRgTz1Jjut1fDXV+jAnu2KFd344Y3Pvh/D+cyY2A2HateqXJmHTWeH2kKjOlDvI0d322gy55pJfbneYdqQ92mO3/goz2V8taPg7gh3P0Hmvaac1+6FVRoTEXEziHUFe1gxmkWWY+JVjFijQgFY4zqFHahdQlNk4+/sma8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721771121; c=relaxed/simple;
	bh=s0Xx4U7QoLp2cO1gIy+fXdv3N2qBOlipTZ8rK4n92dA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nPebds88aX7L///uSQ5zcAdQ9rB1YMbkC4lCm50Es5ROJH8S6L09AhBwqWpVUjgXsQiaDWyQhNAZrrTdrHAqdx46+gdexiIw6g5GD6kWoc7htyVTkdnJgd5IcRZIC7oWBTu48tpQFUkAk/fVkC3EWyLuG6vHy1GA1KSqx5KZGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cy46kVrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cy46kVrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31246C4AF09;
	Tue, 23 Jul 2024 21:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721771121;
	bh=s0Xx4U7QoLp2cO1gIy+fXdv3N2qBOlipTZ8rK4n92dA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cy46kVrhqxa3GmGlhVtZFjxjrNnDYQwnyojAMUZ9ldz4eMtQX+mG4ibDDjhN5LR5W
	 Uac8seyee5cVuVWa/hZTs7XWGa881rL9voINRrtRXDrnq/NggFIgS/zXCWFW+lPIL9
	 UmlaI1ivEqRxDcUq0kmmp1hGues3G4X4R63Nb/CQ=
Date: Tue, 23 Jul 2024 14:45:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, "Huang, Ying"
 <ying.huang@intel.com>
Subject: Re: [akpm-mm:mm-unstable 9/30] mm/memory-tiers.c:64:6: error:
 redefinition of 'folio_has_cpupid'
Message-Id: <20240723144520.465d13ed2b48613c43028426@linux-foundation.org>
In-Reply-To: <92316F08-AF73-46E6-B82D-E40970CB6E94@nvidia.com>
References: <202407240024.Lhu1XDok-lkp@intel.com>
	<92316F08-AF73-46E6-B82D-E40970CB6E94@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jul 2024 12:35:23 -0400 Zi Yan <ziy@nvidia.com> wrote:

> >   > 64	bool folio_has_cpupid(struct folio *folio)
> >     65	{
> >     66		return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) ||
> >     67		       node_is_toptier(folio_nid(folio));
> >     68	}
> >     69	
> 
> The error has been reported by Lorenzo Stoakes at: https://lore.kernel.org/linux-mm/6effd690-3cf2-46bc-8061-2d19922ad4fa@lucifer.local/.
> I will fix it in the next version.

a) "in the next version" is too casual, sorry.  We broke the build!  Panic!
   I'll apply this:

--- a/mm/memory-tiers.c~memory-tiering-introduce-folio_has_cpupid-check-fix
+++ a/mm/memory-tiers.c
@@ -51,6 +51,7 @@ static const struct bus_type memory_tier
 	.dev_name = "memory_tier",
 };
 
+#ifdef CONFIG_NUMA_BALANCING
 /**
  * folio_has_cpupid - check if a folio has cpupid information
  * @folio: folio to check
@@ -66,6 +67,7 @@ bool folio_has_cpupid(struct folio *foli
 	return !(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) ||
 	       node_is_toptier(folio_nid(folio));
 }
+#endif
 
 #ifdef CONFIG_MIGRATION
 static int top_tier_adistance;
_

b) is a next version planned so soon?  If so, why was this version
   sent?  Please try to avoid sending an entire new patchset for a few
   trivial fixups.  Just send the fixups!
