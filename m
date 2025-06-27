Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80672524F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027544; cv=none; b=WA/bu4G6XVp+JvdQ78nX1luKLoNR3Oj3yx6VuJV3eVvPy8B3F5tZKZR4bY3pBuHnUiudWkVRiBUC3XXgyury+dgGg94KGNtxn/b+hZVob/P88PlmX9fiIZ9qpXZ65mDtsBtYkeqVfGUqzZeMACUh1HP03aB9b4LEqK+M0lzKCxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027544; c=relaxed/simple;
	bh=c65bRKm3aiPDN2LkBinl5syrb7JrcE/ggooMW1KwH2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C94wN/ZuE85IVCQifSlM5IV4e1oug7HEJDpbDFil2u8CfBxHJaUI3T4Mhf9GaC+iIpT71Gj2EhKhTvIFVCUf1SHtk5zK9cTOeaYlTKkk/CEeYtdf+IhLx5ZAfVIop5yAtpYa03R0Txdjsqo0U8LZzS9QiyWtj7vr/tZn/IztXrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=UJa7xwDP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=73qb4L5m; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Dd7dxhKO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XvpzBKDV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="UJa7xwDP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="73qb4L5m";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Dd7dxhKO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XvpzBKDV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 533F021175;
	Fri, 27 Jun 2025 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751027540;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cldzQ9ALyrSjzBNZ4xDHMgwX2PoYDd/nnm57boj47A4=;
	b=UJa7xwDPlgYCiNohxUdJqpjNcBOYHJX6k/IzrquV4A+1lN8JoWbVLdBoP1jLc3gbH+Si8n
	+gF8Mq3swJNSac+XQSKfBTq07LSwVeYyax0rYPX9YFemoYulUBkxlRGkZUnifwuYgJUGrh
	f2GpOpEFOfYxlaSPWLZt2YdImFkA6JA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751027540;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cldzQ9ALyrSjzBNZ4xDHMgwX2PoYDd/nnm57boj47A4=;
	b=73qb4L5mNY8WxucRDMr8AswLqZVUa5gflGefUr7BRKpeWDd16TrkcbARQhLsBQKldbKJtU
	tn2cArnQl1ez/WBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Dd7dxhKO;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=XvpzBKDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1751027539;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cldzQ9ALyrSjzBNZ4xDHMgwX2PoYDd/nnm57boj47A4=;
	b=Dd7dxhKOyZrwAzvgRuKcXOuQAttsvEnLt6164M5R70srxgTuPSOQpRuKBuTLnZFOrzRqrd
	rhqWq/ZfhsJGAf6FaUsgMc1yZx9YdIApk2E8gizRC8akV0Yl4ANTnqqD+BEpwcog8SH5MV
	Zz6zrBDShe4P5WkUohjy7ReT0f/cY+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1751027539;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cldzQ9ALyrSjzBNZ4xDHMgwX2PoYDd/nnm57boj47A4=;
	b=XvpzBKDVH4/Vcglx4Tcfg7yJoFTkSO1FLBDgUxgAdoSQ6wxHxUjiw3ejoWgTeI2XC1YLRV
	bxHy/uq3SHN8HqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32DD813A8E;
	Fri, 27 Jun 2025 12:32:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RXs0DFOPXmhjKwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Fri, 27 Jun 2025 12:32:19 +0000
Date: Fri, 27 Jun 2025 14:32:13 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: David Sterba <dsterba@suse.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] btrfs: open code RCU for device name
Message-ID: <20250627123213.GG31241@suse.cz>
Reply-To: dsterba@suse.cz
References: <1e539dfd73debc86ddc7c1b1716f86ace14d51aa.1750858539.git.dsterba@suse.com>
 <202506271745.xBqbUHXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506271745.xBqbUHXo-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid,suse.cz:replyto,git-scm.com:url,intel.com:email,01.org:url]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 533F021175
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.21

On Fri, Jun 27, 2025 at 05:13:20PM +0800, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on kdave/for-next]
> [also build test WARNING on next-20250626]
> [cannot apply to linus/master v6.16-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Sterba/btrfs-open-code-RCU-for-device-name/20250625-214017
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> patch link:    https://lore.kernel.org/r/1e539dfd73debc86ddc7c1b1716f86ace14d51aa.1750858539.git.dsterba%40suse.com
> patch subject: [PATCH v2 1/2] btrfs: open code RCU for device name
> config: powerpc64-randconfig-r133-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271745.xBqbUHXo-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
> reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271745.xBqbUHXo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271745.xBqbUHXo-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> fs/btrfs/volumes.c:407:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got char const [noderef] __rcu *name @@
>    fs/btrfs/volumes.c:407:21: sparse:     expected void const *objp
>    fs/btrfs/volumes.c:407:21: sparse:     got char const [noderef] __rcu *name
> >> fs/btrfs/volumes.c:661:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *device_path @@     got char const [noderef] __rcu *name @@
>    fs/btrfs/volumes.c:661:43: sparse:     expected char const *device_path
>    fs/btrfs/volumes.c:661:43: sparse:     got char const [noderef] __rcu *name
> >> fs/btrfs/volumes.c:1022:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char const *dev_path @@     got char const [noderef] __rcu *name @@
>    fs/btrfs/volumes.c:1022:34: sparse:     expected char const *dev_path
>    fs/btrfs/volumes.c:1022:34: sparse:     got char const [noderef] __rcu *name
> >> fs/btrfs/volumes.c:1424:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
>    fs/btrfs/volumes.c:1424:42: sparse:     expected char const *
>    fs/btrfs/volumes.c:1424:42: sparse:     got char const [noderef] __rcu *name
>    fs/btrfs/volumes.c:2174:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *device_path @@     got char const [noderef] __rcu *name @@
>    fs/btrfs/volumes.c:2174:31: sparse:     expected char const *device_path
>    fs/btrfs/volumes.c:2174:31: sparse:     got char const [noderef] __rcu *name
> 
> vim +407 fs/btrfs/volumes.c
> 
> 2208a378f35fea7 Ilya Dryomov    2013-08-12  402  
> f2db4d5cb457b7d Filipe Manana   2023-04-26  403  static void btrfs_free_device(struct btrfs_device *device)
> 48dae9cf3f95acc David Sterba    2017-10-30  404  {
> bbbf7243d62d8be Nikolay Borisov 2019-03-25  405  	WARN_ON(!list_empty(&device->post_commit_list));
> 9fc9a5a2dc4bd09 David Sterba    2025-06-09  406  	/* No need to call kfree_rcu(), nothing is reading the device name. */
> 9fc9a5a2dc4bd09 David Sterba    2025-06-09 @407  	kfree(device->name);

All the warnings are for places where raw ->name is used because we know
it's safe given the context. A rcu_dereference would work and is not
necessary but will trigger the warnings. OTOH if there isn't the __rcu
annotation we can't get any checks where it would be desired.
