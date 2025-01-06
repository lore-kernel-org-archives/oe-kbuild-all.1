Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB014AD2B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184146; cv=none; b=ZaCjAnmBi7pbH9BZRBeXccNVF/TTQdzo+gZBa+qP2W/bXDAIPDFsH5V8Vf/l+1AAmIIiZCgR3mV7RPg0P/Alt6Lum1+3+urmDhx4jYRmzTrc05asfgXSN75+FZZ/WJP8t45p8NHleqnxmFR1awrxakZEcUEpTwMdkoJifN4LXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184146; c=relaxed/simple;
	bh=TZ3x29p6VdcRxlm6e+uvlsMenKYTOSwJQmSSCCCoLs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL9n29pbGjiM+PqaISl61R8I2F0xdr+QyRKnzWsH+Xl6H1QZJkpD6o2kygSnv8ZuMu1JkU2Lbq6xinWv6SSBDdKZbNFtYAiGHkcg37j3B56ON6v4xl5VCRCiAehvGaLG/ev2XhwDU9oeE9Ge6k8a68ZSF04xiT0WaDJCCooRZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=JwhzBy4P; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="JwhzBy4P"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YRgwX1gP0zZJf;
	Mon,  6 Jan 2025 18:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1736184140;
	bh=NK/YO1F/UkyhD3QZ5FJr+tCxVVKVDgINATARWiYbMTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwhzBy4PkHVVyqtwAKNH5QLUD08KmbeqQ4mSgVcTkyCH47+XOgvwWEk4o7RzkHb7h
	 eG3SBpcH3KSetPivFPbJx3uBtjnk7MvsNVJ2JIyDrxRaP+YSvUeAaQbNodQXr1Ix7g
	 YxcInR6+eyAKaKZrrSAiwJWNuzPpdZWe5c8KouYE=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YRgwW3THQzBSv;
	Mon,  6 Jan 2025 18:22:18 +0100 (CET)
Date: Mon, 6 Jan 2025 18:22:17 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-doc@vger.kernel.org
Subject: Re: security/landlock/fs.c:719: warning: Function parameter or
 struct member '' not described in 'collect_domain_accesses'
Message-ID: <20250106.ohsoo1eeWahy@digikod.net>
References: <202501011904.VXOMzLe7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202501011904.VXOMzLe7-lkp@intel.com>
X-Infomaniak-Routing: alpha

Similar scripts/kernel-doc issue:
- https://lore.kernel.org/all/20250106.iinooheeQu8z@digikod.net/
- https://lore.kernel.org/all/20250106.iejae7ueh1Ka@digikod.net/

On Wed, Jan 01, 2025 at 07:50:18PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
> commit: b91c3e4ea756b12b7d992529226edce1cfd854d7 landlock: Add support for file reparenting with LANDLOCK_ACCESS_FS_REFER
> date:   2 years, 7 months ago
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501011904.VXOMzLe7-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011904.VXOMzLe7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501011904.VXOMzLe7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 478.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 478.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 478.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 478.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 478.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 478.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 478.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 478.
>    security/landlock/fs.c:478: warning: Function parameter or struct member '' not described in 'check_access_path_dual'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 478.
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 478.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 478.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 478.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 478.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 478.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 478.
>    Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 478.
>    Use of uninitialized value $parameterlist[6] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 478.
>    security/landlock/fs.c:478: warning: Excess function parameter 'layer_masks_parent1' description in 'check_access_path_dual'
>    security/landlock/fs.c:478: warning: Excess function parameter 'layer_masks_parent2' description in 'check_access_path_dual'
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 719.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 719.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 719.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 719.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 719.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 719.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 719.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 719.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 719.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 719.
> >> security/landlock/fs.c:719: warning: Function parameter or struct member '' not described in 'collect_domain_accesses'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 719.
>    Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 719.
> >> security/landlock/fs.c:719: warning: Excess function parameter 'layer_masks_dom' description in 'collect_domain_accesses'
> 
> 
> vim +719 security/landlock/fs.c
> 
>    693	
>    694	/**
>    695	 * collect_domain_accesses - Walk through a file path and collect accesses
>    696	 *
>    697	 * @domain: Domain to check against.
>    698	 * @mnt_root: Last directory to check.
>    699	 * @dir: Directory to start the walk from.
>    700	 * @layer_masks_dom: Where to store the collected accesses.
>    701	 *
>    702	 * This helper is useful to begin a path walk from the @dir directory to a
>    703	 * @mnt_root directory used as a mount point.  This mount point is the common
>    704	 * ancestor between the source and the destination of a renamed and linked
>    705	 * file.  While walking from @dir to @mnt_root, we record all the domain's
>    706	 * allowed accesses in @layer_masks_dom.
>    707	 *
>    708	 * This is similar to check_access_path_dual() but much simpler because it only
>    709	 * handles walking on the same mount point and only check one set of accesses.
>    710	 *
>    711	 * Returns:
>    712	 * - true if all the domain access rights are allowed for @dir;
>    713	 * - false if the walk reached @mnt_root.
>    714	 */
>    715	static bool collect_domain_accesses(
>    716		const struct landlock_ruleset *const domain,
>    717		const struct dentry *const mnt_root, struct dentry *dir,
>    718		layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS])
>  > 719	{
>    720		unsigned long access_dom;
>    721		bool ret = false;
>    722	
>    723		if (WARN_ON_ONCE(!domain || !mnt_root || !dir || !layer_masks_dom))
>    724			return true;
>    725		if (is_nouser_or_private(dir))
>    726			return true;
>    727	
>    728		access_dom = init_layer_masks(domain, LANDLOCK_MASK_ACCESS_FS,
>    729					      layer_masks_dom);
>    730	
>    731		dget(dir);
>    732		while (true) {
>    733			struct dentry *parent_dentry;
>    734	
>    735			/* Gets all layers allowing all domain accesses. */
>    736			if (unmask_layers(find_rule(domain, dir), access_dom,
>    737					  layer_masks_dom)) {
>    738				/*
>    739				 * Stops when all handled accesses are allowed by at
>    740				 * least one rule in each layer.
>    741				 */
>    742				ret = true;
>    743				break;
>    744			}
>    745	
>    746			/* We should not reach a root other than @mnt_root. */
>    747			if (dir == mnt_root || WARN_ON_ONCE(IS_ROOT(dir)))
>    748				break;
>    749	
>    750			parent_dentry = dget_parent(dir);
>    751			dput(dir);
>    752			dir = parent_dentry;
>    753		}
>    754		dput(dir);
>    755		return ret;
>    756	}
>    757	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
