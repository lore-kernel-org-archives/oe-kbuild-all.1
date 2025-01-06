Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AE144D1A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180322; cv=none; b=qhEkEx/oJmTjAKQSF1vT84bnLWtwXMNF6BrWYDeo6ly88yqUyw9glge8GFU2df89hTEuSh/vb5VM7hQHZEnmgA1SEH4At50NelnBoFRbdmyo8Ec493aJNTr3I6zWdD3oLeL25EHuM/+OafS9REMXkHZHpsCdtH88A861LbRz/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180322; c=relaxed/simple;
	bh=EPtPVPpcLiR6UzLwqrxll+lA6o6RU0W3qI7Jema2pU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZHUMGTYnTV5mi3FuqYtgQd5pCm5tgkU376X0Y7XLYOSkKBxh8YFN7UDD9MVqSogKwwnU9hHxx/EMQ88nDZo0ok6wxDAWRZHsUAcPwgiy5/Awsr/ESj82YA/5sWjI3EkGG01Toi9x0QWQlgn1SPE0L6kggV4QA715NvVtuu3nJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=NkTrTamK; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="NkTrTamK"
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YRfW13J79zNgw;
	Mon,  6 Jan 2025 17:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1736180317;
	bh=1dPLAHFg4jRDrwUf993b3sVbFG6B/sBpCgivOcPqNvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkTrTamKPnz5P4xveFPw1wK0GaaJgtM6mx3z/iepMmQvjX6t1gd5bq8OJBRX8SFtZ
	 7LX8pAAkgT0Pv5wfTwRVLaG1KcJhPJ/7z8qj4N8KIqYFh7ma4XN1LIIk7wGC8EOR/M
	 qnhWoStOl5+eSLvzreX207Hx+VOEc8JWxeVCAGQ4=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YRfW069G7z61N;
	Mon,  6 Jan 2025 17:18:36 +0100 (CET)
Date: Mon, 6 Jan 2025 17:18:36 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel test robot <lkp@intel.com>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: security/landlock/ruleset.c:644: warning: Function parameter or
 struct member '' not described in 'landlock_init_layer_masks'
Message-ID: <20250106.iejae7ueh1Ka@digikod.net>
References: <202501060543.XG0RGoPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202501060543.XG0RGoPB-lkp@intel.com>
X-Infomaniak-Routing: alpha

scripts/kernel-doc definitely has an issue with pointers to array.

On Mon, Jan 06, 2025 at 05:07:32AM +0800, kernel test robot wrote:
> Hi Konstantin,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9244696b34f2a626d7468864420ab6a47289bf10
> commit: 0e7410112964168a65578002269ae3b80b207936 landlock: Move and rename layer helpers
> date:   1 year, 2 months ago
> config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501060543.XG0RGoPB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 182.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 182.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 182.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 182.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 182.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 182.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 182.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 182.
>    security/landlock/ruleset.c:182: warning: Function parameter or struct member '' not described in 'insert_rule'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 182.
>    Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 182.
>    security/landlock/ruleset.c:182: warning: Excess function parameter 'layers' description in 'insert_rule'
>    Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 644.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
>    Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
>    Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 644.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 644.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 644.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 644.
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 644.
>    Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 644.
>    Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 644.
> >> security/landlock/ruleset.c:644: warning: Function parameter or struct member '' not described in 'landlock_init_layer_masks'
>    Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 644.
>    Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 644.
> >> security/landlock/ruleset.c:644: warning: Excess function parameter 'layer_masks' description in 'landlock_init_layer_masks'
> 
> 
> vim +644 security/landlock/ruleset.c
> 
>    626	
>    627	/**
>    628	 * landlock_init_layer_masks - Initialize layer masks from an access request
>    629	 *
>    630	 * Populates @layer_masks such that for each access right in @access_request,
>    631	 * the bits for all the layers are set where this access right is handled.
>    632	 *
>    633	 * @domain: The domain that defines the current restrictions.
>    634	 * @access_request: The requested access rights to check.
>    635	 * @layer_masks: The layer masks to populate.
>    636	 *
>    637	 * Returns: An access mask where each access right bit is set which is handled
>    638	 * in any of the active layers in @domain.
>    639	 */
>    640	access_mask_t landlock_init_layer_masks(
>    641		const struct landlock_ruleset *const domain,
>    642		const access_mask_t access_request,
>    643		layer_mask_t (*const layer_masks)[LANDLOCK_NUM_ACCESS_FS])
>  > 644	{
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
