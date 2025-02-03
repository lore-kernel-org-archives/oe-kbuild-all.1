Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333485474C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625081; cv=none; b=Z2jGsOtk0IRYwTSDcK02/qACxRCrTFqikbEPj/gvcmYCbVrDFRpN8pDS3apR/YhanrYFn3Vj4WpYhl+3VZz3hlQJsweFiU3LNVhJ14m/qb7EY4Hpdex3aiATMJg4x+eRr+iQBrtB6Hec+JCKmdpFBt4jdIgfqVmsGD1Ri2uOm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625081; c=relaxed/simple;
	bh=/RrkLchOV/HVjmiy3BO2s3tXQgACbiUuc8EmOUR5D/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gy4jr0onxT2LQlTwMA1HTbZqgiyrIDaxNX2QOfXVkKtee8kvjK6LMaC5QUwcXnwRCFhGC7z4LoPI8mpVvmMpX88ZPbxGT49HN0p3K+6yq6eyJ6EsSdQBDry+8Q+4tTYz/yTdn5F1kjVwEzN/D13NKBOgUT4WJtPy86JthxZEhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwv+TVzm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwv+TVzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738625079; x=1770161079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/RrkLchOV/HVjmiy3BO2s3tXQgACbiUuc8EmOUR5D/I=;
  b=Zwv+TVzmBfGdzCiy04/1+p2ydw6BYd91XVfTU8BNgmo64e+eEVN33lbl
   qW010+fVUWh9Yxc0IDTTVdh2Kh2sOLGPBfZHNDF6e0lkZE5iqjNKGWpIa
   0Ay+AgWhdeKZArYqN1lWslgzV3JdAStUkUVwcnyiuyraAjz6JN9MZm6IT
   3CCeRfHpP3HpFgvJVmKr8RJADggxSpX59gUOky9hWywX1hxBpC7yjTjO5
   0LCgWoGYjjBdCJVcTLS9T7pfYChaOUN1AozDC2R1mTW3DTH93iz3JCsd+
   POukT2WwT44PQ+fevbh4KBVg4ePaUN5SfxGFRZ7voryisWC6cS8dXQSlm
   g==;
X-CSE-ConnectionGUID: L1GDwix1Qjms+cXiGMI6cw==
X-CSE-MsgGUID: zXyGLfs3RSu6jSsthvEjCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50526436"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50526436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:24:39 -0800
X-CSE-ConnectionGUID: qOqlTzsbTOuZqcbiIPWZMA==
X-CSE-MsgGUID: SnyCKQWLToO+BIo0CJwiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115588149"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 15:24:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5nv-000rg1-14;
	Mon, 03 Feb 2025 23:24:35 +0000
Date: Tue, 4 Feb 2025 07:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 23/31] lib/spdm/req-sysfs.c:374:15: error:
 incompatible function pointer types initializing 'ssize_t (*)(struct file *,
 struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'int
 (*)(struct file *, struct kobject *, struct bin_attribute *, char...
Message-ID: <202502040710.Ab4fyfUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   3dfd8df6bd32c540b7cf5dd1284932a7138f1771
commit: b629ea55d7450da816e58232c60d03af80eca470 [23/31] PCI/CMA: Expose a log of received signatures in sysfs
config: i386-randconfig-006-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040710.Ab4fyfUA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040710.Ab4fyfUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040710.Ab4fyfUA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/spdm/req-sysfs.c:374:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned int)') with an expression of type 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned int)') [-Wincompatible-function-pointer-types]
     374 |                         .read      = sysfs_bin_attr_simple_read,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm/req-sysfs.c:382:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned int)') with an expression of type 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned int)') [-Wincompatible-function-pointer-types]
     382 |                         .read      = sysfs_bin_attr_simple_read,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm/req-sysfs.c:389:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned int)') with an expression of type 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned int)') [-Wincompatible-function-pointer-types]
     389 |                         .read      = sysfs_bin_attr_simple_read,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm/req-sysfs.c:396:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned int)') with an expression of type 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'int (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned int)') [-Wincompatible-function-pointer-types]
     396 |                         .read      = sysfs_bin_attr_simple_read,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +374 lib/spdm/req-sysfs.c

   342	
   343	/**
   344	 * spdm_create_log_entry() - Allocate log entry for one received SPDM signature
   345	 *
   346	 * @spdm_state: SPDM session state
   347	 * @spdm_context: SPDM context (needed to create combined_spdm_prefix)
   348	 * @slot: Slot which was used to generate the signature
   349	 *	(needed to create certificate_chain symlink)
   350	 * @req_nonce_off: Requester nonce offset within the transcript
   351	 * @rsp_nonce_off: Responder nonce offset within the transcript
   352	 *
   353	 * Allocate and populate a struct spdm_log_entry upon device authentication.
   354	 * Publish it in sysfs if the device has already been registered through
   355	 * device_add().
   356	 */
   357	void spdm_create_log_entry(struct spdm_state *spdm_state,
   358				   const char *spdm_context, u8 slot,
   359				   size_t req_nonce_off, size_t rsp_nonce_off)
   360	{
   361		struct spdm_log_entry *log = kmalloc(sizeof(*log), GFP_KERNEL);
   362		if (!log)
   363			return;
   364	
   365		*log = (struct spdm_log_entry) {
   366			.slot		   = slot,
   367			.version	   = spdm_state->version,
   368			.counter	   = spdm_state->log_counter,
   369			.list		   = LIST_HEAD_INIT(log->list),
   370	
   371			.sig = {
   372				.attr.name = log->sig_name,
   373				.attr.mode = 0444,
 > 374				.read	   = sysfs_bin_attr_simple_read,
   375				.private   = spdm_state->transcript_end -
   376					     spdm_state->sig_len,
   377				.size	   = spdm_state->sig_len },
   378	
   379			.req_nonce = {
   380				.attr.name = log->req_nonce_name,
   381				.attr.mode = 0444,
   382				.read	   = sysfs_bin_attr_simple_read,
   383				.private   = spdm_state->transcript + req_nonce_off,
   384				.size	   = SPDM_NONCE_SZ },
   385	
   386			.rsp_nonce = {
   387				.attr.name = log->rsp_nonce_name,
   388				.attr.mode = 0444,
   389				.read	   = sysfs_bin_attr_simple_read,
   390				.private   = spdm_state->transcript + rsp_nonce_off,
   391				.size	   = SPDM_NONCE_SZ },
   392	
   393			.transcript = {
   394				.attr.name = log->transcript_name,
   395				.attr.mode = 0444,
   396				.read	   = sysfs_bin_attr_simple_read,
   397				.private   = spdm_state->transcript,
   398				.size	   = spdm_state->transcript_end -
   399					     spdm_state->transcript -
   400					     spdm_state->sig_len },
   401	
   402			.combined_prefix = {
   403				.attr.name = log->combined_prefix_name,
   404				.attr.mode = 0444,
   405				.read	   = spdm_read_combined_prefix,
   406				.private   = log,
   407				.size	   = spdm_state->version <= 0x11 ? 0 :
   408					     SPDM_COMBINED_PREFIX_SZ },
   409	
   410			.spdm_context = {
   411				.attr.attr.name = log->spdm_context_name,
   412				.attr.attr.mode = 0444,
   413				.attr.show = device_show_string,
   414				.var	   = (char *)spdm_context },
   415	
   416			.hash_alg = {
   417				.attr.attr.name = log->hash_alg_name,
   418				.attr.attr.mode = 0444,
   419				.attr.show = device_show_string,
   420				.var	   = (char *)spdm_state->base_hash_alg_name },
   421		};
   422	
   423		snprintf(log->sig_name, sizeof(log->sig_name),
   424			 "%u_signature", spdm_state->log_counter);
   425		snprintf(log->req_nonce_name, sizeof(log->req_nonce_name),
   426			 "%u_requester_nonce", spdm_state->log_counter);
   427		snprintf(log->rsp_nonce_name, sizeof(log->rsp_nonce_name),
   428			 "%u_responder_nonce", spdm_state->log_counter);
   429		snprintf(log->transcript_name, sizeof(log->transcript_name),
   430			 "%u_transcript", spdm_state->log_counter);
   431		snprintf(log->combined_prefix_name, sizeof(log->combined_prefix_name),
   432			 "%u_combined_spdm_prefix", spdm_state->log_counter);
   433		snprintf(log->spdm_context_name, sizeof(log->spdm_context_name),
   434			 "%u_type", spdm_state->log_counter);
   435		snprintf(log->hash_alg_name, sizeof(log->hash_alg_name),
   436			 "%u_hash_algorithm", spdm_state->log_counter);
   437	
   438		sysfs_bin_attr_init(&log->sig);
   439		sysfs_bin_attr_init(&log->req_nonce);
   440		sysfs_bin_attr_init(&log->rsp_nonce);
   441		sysfs_bin_attr_init(&log->transcript);
   442		sysfs_bin_attr_init(&log->combined_prefix);
   443		sysfs_attr_init(&log->spdm_context.attr.attr);
   444		sysfs_attr_init(&log->hash_alg.attr.attr);
   445	
   446		list_add_tail(&log->list, &spdm_state->log);
   447		spdm_state->log_counter++;
   448	
   449		/* Steal transcript pointer ahead of spdm_free_transcript() */
   450		spdm_state->transcript = NULL;
   451	
   452		if (device_is_registered(spdm_state->dev))
   453			spdm_publish_log_entry(&spdm_state->dev->kobj, log);
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
