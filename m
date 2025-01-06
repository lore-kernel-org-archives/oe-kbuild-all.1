Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551951DDA2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180210; cv=none; b=t40A1XrBRmRBod78T8X35biP88jw2owCUOeCjJ7FjyHQs4GtvVQhDH9CF07VVHyrRsS1dIddDlD7asBx6qHGiSQWp+1tSqhxceE07em/gZp2bQ0UFJT34c5x23NhGx/2hki9KsdDojjunuCxqdNu/v3PzsCgTnJaVsviCfcFwvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180210; c=relaxed/simple;
	bh=g2jSVfnmVyx9Hsg19p+bbyBSlIJKKoQIfFxnX8U4pJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glTUA5ksXxPm5H6tCw/vLlKhKYb0nNsyZTgLQr5EUblqXpJrJ1u05+yFJnNOVwNglWtfx7GqFZB7jjcNNjbqpo/lFjmPGmP8JlYqwSb7CyHDgHG3UUpKYqeh42CgaUlnuKUPft4ZML6ukToV5adaO1joqK88YJI1ZdBHyiMzpIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=TnwBzlYM; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="TnwBzlYM"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YRfSq17mxzLs9;
	Mon,  6 Jan 2025 17:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1736180203;
	bh=fquV7O7zIgRcO5Nw8ibUwzahjTYbIcETvciR6ElYwNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnwBzlYMcEHweTHUPsWhWRyMiBGvl8le7+gYnZ6PJX9jCxFu++Rt/MT/JmGDVT3C6
	 SEkUJt2siic7wCl0txKXwVSOhrJQXZrFKagsMAciq7ocumlb8uW67P2I8vhJa08hXn
	 oc/ySvf4pVF0/CMMIzWeoR+bFYaPPSDUdlFbOUKw=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YRfSp2lpVz9FM;
	Mon,  6 Jan 2025 17:16:39 +0100 (CET)
Date: Mon, 6 Jan 2025 17:16:39 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel test robot <lkp@intel.com>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: security/landlock/fs.c:480: warning: Function parameter or
 struct member '' not described in 'is_access_to_paths_allowed'
Message-ID: <20250106.iinooheeQu8z@digikod.net>
References: <202501051942.ltat2hZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202501051942.ltat2hZ8-lkp@intel.com>
X-Infomaniak-Routing: alpha

It looks like scripts/kernel-doc has an issue parsing some function's
arguments.

On Sun, Jan 05, 2025 at 07:10:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
> commit: 106794c46b13a2820d3954d7a2892fa1978b4162 landlock: Refactor check_access_path_dual() into is_access_to_paths_allowed()
> date:   2 years, 3 months ago
> config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250105/202501051942.ltat2hZ8-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051942.ltat2hZ8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501051942.ltat2hZ8-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 480.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 480.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 480.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 480.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 480.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 480.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 480.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 480.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 480.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 480.
> >> security/landlock/fs.c:480: warning: Function parameter or struct member '' not described in 'is_access_to_paths_allowed'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 480.
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 480.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 480.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 480.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 480.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 480.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 480.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 480.
>    Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 480.
>    Use of uninitialized value $parameterlist[6] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 480.
> >> security/landlock/fs.c:480: warning: Excess function parameter 'layer_masks_parent1' description in 'is_access_to_paths_allowed'
> >> security/landlock/fs.c:480: warning: Excess function parameter 'layer_masks_parent2' description in 'is_access_to_paths_allowed'
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 707.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 707.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 707.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 707.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 707.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 707.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 707.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 707.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 707.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 707.
>    security/landlock/fs.c:707: warning: Function parameter or struct member '' not described in 'collect_domain_accesses'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 707.
>    Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 707.
>    security/landlock/fs.c:707: warning: Excess function parameter 'layer_masks_dom' description in 'collect_domain_accesses'
> 
> 
> vim +480 security/landlock/fs.c
> 
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  431  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  432  /**
> 106794c46b13a2 Günther Noack  2022-10-18  433   * is_access_to_paths_allowed - Check accesses for requests with a common path
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  434   *
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  435   * @domain: Domain to check against.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  436   * @path: File hierarchy to walk through.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  437   * @access_request_parent1: Accesses to check, once @layer_masks_parent1 is
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  438   *     equal to @layer_masks_parent2 (if any).  This is tied to the unique
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  439   *     requested path for most actions, or the source in case of a refer action
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  440   *     (i.e. rename or link), or the source and destination in case of
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  441   *     RENAME_EXCHANGE.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  442   * @layer_masks_parent1: Pointer to a matrix of layer masks per access
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  443   *     masks, identifying the layers that forbid a specific access.  Bits from
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  444   *     this matrix can be unset according to the @path walk.  An empty matrix
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  445   *     means that @domain allows all possible Landlock accesses (i.e. not only
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  446   *     those identified by @access_request_parent1).  This matrix can
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  447   *     initially refer to domain layer masks and, when the accesses for the
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  448   *     destination and source are the same, to requested layer masks.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  449   * @dentry_child1: Dentry to the initial child of the parent1 path.  This
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  450   *     pointer must be NULL for non-refer actions (i.e. not link nor rename).
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  451   * @access_request_parent2: Similar to @access_request_parent1 but for a
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  452   *     request involving a source and a destination.  This refers to the
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  453   *     destination, except in case of RENAME_EXCHANGE where it also refers to
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  454   *     the source.  Must be set to 0 when using a simple path request.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  455   * @layer_masks_parent2: Similar to @layer_masks_parent1 but for a refer
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  456   *     action.  This must be NULL otherwise.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  457   * @dentry_child2: Dentry to the initial child of the parent2 path.  This
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  458   *     pointer is only set for RENAME_EXCHANGE actions and must be NULL
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  459   *     otherwise.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  460   *
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  461   * This helper first checks that the destination has a superset of restrictions
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  462   * compared to the source (if any) for a common path.  Because of
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  463   * RENAME_EXCHANGE actions, source and destinations may be swapped.  It then
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  464   * checks that the collected accesses and the remaining ones are enough to
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  465   * allow the request.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  466   *
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  467   * Returns:
> 106794c46b13a2 Günther Noack  2022-10-18  468   * - true if the access request is granted;
> 106794c46b13a2 Günther Noack  2022-10-18  469   * - false otherwise.
> 106794c46b13a2 Günther Noack  2022-10-18  470   */
> 106794c46b13a2 Günther Noack  2022-10-18  471  static bool is_access_to_paths_allowed(
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  472  	const struct landlock_ruleset *const domain,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  473  	const struct path *const path,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  474  	const access_mask_t access_request_parent1,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  475  	layer_mask_t (*const layer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS],
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  476  	const struct dentry *const dentry_child1,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  477  	const access_mask_t access_request_parent2,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  478  	layer_mask_t (*const layer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS],
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  479  	const struct dentry *const dentry_child2)
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06 @480  {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  481  	bool allowed_parent1 = false, allowed_parent2 = false, is_dom_check,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  482  	     child1_is_directory = true, child2_is_directory = true;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  483  	struct path walker_path;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  484  	access_mask_t access_masked_parent1, access_masked_parent2;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  485  	layer_mask_t _layer_masks_child1[LANDLOCK_NUM_ACCESS_FS],
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  486  		_layer_masks_child2[LANDLOCK_NUM_ACCESS_FS];
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  487  	layer_mask_t(*layer_masks_child1)[LANDLOCK_NUM_ACCESS_FS] = NULL,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  488  	(*layer_masks_child2)[LANDLOCK_NUM_ACCESS_FS] = NULL;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  489  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  490  	if (!access_request_parent1 && !access_request_parent2)
> 106794c46b13a2 Günther Noack  2022-10-18  491  		return true;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  492  	if (WARN_ON_ONCE(!domain || !path))
> 106794c46b13a2 Günther Noack  2022-10-18  493  		return true;
> 9da82b20fde958 Mickaël Salaün 2022-05-06  494  	if (is_nouser_or_private(path->dentry))
> 106794c46b13a2 Günther Noack  2022-10-18  495  		return true;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  496  	if (WARN_ON_ONCE(domain->num_layers < 1 || !layer_masks_parent1))
> 106794c46b13a2 Günther Noack  2022-10-18  497  		return false;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  498  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  499  	if (unlikely(layer_masks_parent2)) {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  500  		if (WARN_ON_ONCE(!dentry_child1))
> 106794c46b13a2 Günther Noack  2022-10-18  501  			return false;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  502  		/*
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  503  		 * For a double request, first check for potential privilege
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  504  		 * escalation by looking at domain handled accesses (which are
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  505  		 * a superset of the meaningful requested accesses).
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  506  		 */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  507  		access_masked_parent1 = access_masked_parent2 =
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  508  			get_handled_accesses(domain);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  509  		is_dom_check = true;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  510  	} else {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  511  		if (WARN_ON_ONCE(dentry_child1 || dentry_child2))
> 106794c46b13a2 Günther Noack  2022-10-18  512  			return false;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  513  		/* For a simple request, only check for requested accesses. */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  514  		access_masked_parent1 = access_request_parent1;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  515  		access_masked_parent2 = access_request_parent2;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  516  		is_dom_check = false;
> 8ba0005ff418ec Mickaël Salaün 2022-05-06  517  	}
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  518  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  519  	if (unlikely(dentry_child1)) {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  520  		unmask_layers(find_rule(domain, dentry_child1),
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  521  			      init_layer_masks(domain, LANDLOCK_MASK_ACCESS_FS,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  522  					       &_layer_masks_child1),
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  523  			      &_layer_masks_child1);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  524  		layer_masks_child1 = &_layer_masks_child1;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  525  		child1_is_directory = d_is_dir(dentry_child1);
> 8ba0005ff418ec Mickaël Salaün 2022-05-06  526  	}
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  527  	if (unlikely(dentry_child2)) {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  528  		unmask_layers(find_rule(domain, dentry_child2),
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  529  			      init_layer_masks(domain, LANDLOCK_MASK_ACCESS_FS,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  530  					       &_layer_masks_child2),
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  531  			      &_layer_masks_child2);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  532  		layer_masks_child2 = &_layer_masks_child2;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  533  		child2_is_directory = d_is_dir(dentry_child2);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  534  	}
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  535  
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  536  	walker_path = *path;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  537  	path_get(&walker_path);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  538  	/*
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  539  	 * We need to walk through all the hierarchy to not miss any relevant
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  540  	 * restriction.
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  541  	 */
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  542  	while (true) {
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  543  		struct dentry *parent_dentry;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  544  		const struct landlock_rule *rule;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  545  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  546  		/*
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  547  		 * If at least all accesses allowed on the destination are
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  548  		 * already allowed on the source, respectively if there is at
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  549  		 * least as much as restrictions on the destination than on the
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  550  		 * source, then we can safely refer files from the source to
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  551  		 * the destination without risking a privilege escalation.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  552  		 * This also applies in the case of RENAME_EXCHANGE, which
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  553  		 * implies checks on both direction.  This is crucial for
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  554  		 * standalone multilayered security policies.  Furthermore,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  555  		 * this helps avoid policy writers to shoot themselves in the
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  556  		 * foot.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  557  		 */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  558  		if (unlikely(is_dom_check &&
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  559  			     no_more_access(
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  560  				     layer_masks_parent1, layer_masks_child1,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  561  				     child1_is_directory, layer_masks_parent2,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  562  				     layer_masks_child2,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  563  				     child2_is_directory))) {
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  564  			allowed_parent1 = scope_to_request(
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  565  				access_request_parent1, layer_masks_parent1);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  566  			allowed_parent2 = scope_to_request(
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  567  				access_request_parent2, layer_masks_parent2);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  568  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  569  			/* Stops when all accesses are granted. */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  570  			if (allowed_parent1 && allowed_parent2)
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  571  				break;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  572  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  573  			/*
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  574  			 * Now, downgrades the remaining checks from domain
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  575  			 * handled accesses to requested accesses.
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  576  			 */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  577  			is_dom_check = false;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  578  			access_masked_parent1 = access_request_parent1;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  579  			access_masked_parent2 = access_request_parent2;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  580  		}
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  581  
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  582  		rule = find_rule(domain, walker_path.dentry);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  583  		allowed_parent1 = unmask_layers(rule, access_masked_parent1,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  584  						layer_masks_parent1);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  585  		allowed_parent2 = unmask_layers(rule, access_masked_parent2,
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  586  						layer_masks_parent2);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  587  
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  588  		/* Stops when a rule from each layer grants access. */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  589  		if (allowed_parent1 && allowed_parent2)
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  590  			break;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  591  
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  592  jump_up:
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  593  		if (walker_path.dentry == walker_path.mnt->mnt_root) {
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  594  			if (follow_up(&walker_path)) {
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  595  				/* Ignores hidden mount points. */
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  596  				goto jump_up;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  597  			} else {
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  598  				/*
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  599  				 * Stops at the real root.  Denies access
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  600  				 * because not all layers have granted access.
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  601  				 */
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  602  				break;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  603  			}
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  604  		}
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  605  		if (unlikely(IS_ROOT(walker_path.dentry))) {
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  606  			/*
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  607  			 * Stops at disconnected root directories.  Only allows
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  608  			 * access to internal filesystems (e.g. nsfs, which is
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  609  			 * reachable through /proc/<pid>/ns/<namespace>).
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  610  			 */
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  611  			allowed_parent1 = allowed_parent2 =
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  612  				!!(walker_path.mnt->mnt_flags & MNT_INTERNAL);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  613  			break;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  614  		}
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  615  		parent_dentry = dget_parent(walker_path.dentry);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  616  		dput(walker_path.dentry);
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  617  		walker_path.dentry = parent_dentry;
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  618  	}
> cb2c7d1a177605 Mickaël Salaün 2021-04-22  619  	path_put(&walker_path);
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  620  
> 106794c46b13a2 Günther Noack  2022-10-18  621  	return allowed_parent1 && allowed_parent2;
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  622  }
> b91c3e4ea756b1 Mickaël Salaün 2022-05-06  623  
> 
> :::::: The code at line 480 was first introduced by commit
> :::::: b91c3e4ea756b12b7d992529226edce1cfd854d7 landlock: Add support for file reparenting with LANDLOCK_ACCESS_FS_REFER
> 
> :::::: TO: Mickaël Salaün <mic@digikod.net>
> :::::: CC: Mickaël Salaün <mic@digikod.net>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
