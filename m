Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121B16C86D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181173; cv=none; b=cLrdVDw+LUkjbFqLauHkr4ZtjcpD2ktvJ9lvqMEwDuJL5IDf5cmkdxF2hX9ep/xxF5Th8GkNIbZXpURa16/466rcaYq5MtASXj7Cww5qL3mg0wehMN8ZvG3JKz4qGYn5GLVFSnSY534zpmEqM+J8xzwb95RdPSn8UM6GYn2P6dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181173; c=relaxed/simple;
	bh=GjZ5egVdVXLsMlPgweWGwVmXnSUNR/aSTZEEEo6FYBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHWZRt6Om4zRcSe+pxgttYdIO7AEZmBlUS7O/VbIMWnWVRe4DB74DuVzhKk16e6I/eU7U8nIrYf4mGnT1Gn9os0ELhkCXSjCNniIljZ/000CDAnXEZDguspuyKpvIDoGa+T3vZ/1+lPbSdaNIEtRlXJsw7Yt9RmpfRJzV7evfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDmFVjYf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDmFVjYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718181171; x=1749717171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjZ5egVdVXLsMlPgweWGwVmXnSUNR/aSTZEEEo6FYBQ=;
  b=hDmFVjYfgsxLXqpSrVJK6QKU+t+Bg5zg+A8PaYY1aQeDlWqF0duEFe1V
   ad3mhhEMHtFzji4mzQ71dwL5RugrGvUH6ZC2N4Wf2uALWpABuavOfJxRr
   q1TGU871EVoBJgf0NEGJNvAEvRKmSzgjiWyLynEJrDhGzqNXK5pGgtsWw
   /oEni3oFwk3nbR0z68y4VqjDbffNUuDLfZss55jmc34PmqBEyw/CKdbnk
   e7JE0HkOhcL8uFHXmRbV5riVMmcZ3o2vYYWdJ2VTZIyb+2mBIsFyGUf8M
   FZQ63oTKTz6t8yekA5IUCaHw2OFNMKS+tlR6y7xZnyN5MsIjhRWD2JuwP
   g==;
X-CSE-ConnectionGUID: k6juNpjHSHeGXqdufK58Vg==
X-CSE-MsgGUID: UnHpbqw7QSqYVXvPCWQWwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18711095"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="18711095"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:32:41 -0700
X-CSE-ConnectionGUID: K+y8s32eS7SgvkltvxmmGQ==
X-CSE-MsgGUID: yyNuq1+TQk2BAGfJG9ezUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40184565"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 01:32:40 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHJPJ-0001N0-0C;
	Wed, 12 Jun 2024 08:32:37 +0000
Date: Wed, 12 Jun 2024 16:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 15/22] lib/spdm/req-sysfs.c:283:43: warning: '%u'
 directive output may be truncated writing between 1 and 3 bytes into a
 region of size 2
Message-ID: <202406121650.IzxaLrO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   8e3a1b5b59047901e750825b33754ee56d37a673
commit: 5aeb68bd944681b53a3199b3f4cd36559371b691 [15/22] PCI/CMA: Expose a log of received signatures in sysfs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406121650.IzxaLrO8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121650.IzxaLrO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121650.IzxaLrO8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/spdm/req-sysfs.c: In function 'spdm_publish_log_entry':
>> lib/spdm/req-sysfs.c:283:43: warning: '%u' directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Wformat-truncation=]
     283 |         snprintf(slot, sizeof(slot), "slot%u", log->slot);
         |                                           ^~
   lib/spdm/req-sysfs.c:283:38: note: directive argument in the range [0, 255]
     283 |         snprintf(slot, sizeof(slot), "slot%u", log->slot);
         |                                      ^~~~~~~~
   lib/spdm/req-sysfs.c:283:9: note: 'snprintf' output between 6 and 8 bytes into a destination of size 6
     283 |         snprintf(slot, sizeof(slot), "slot%u", log->slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> lib/spdm/req-sysfs.c:220: warning: Function parameter or struct member 'counter' not described in 'spdm_log_entry'
>> lib/spdm/req-sysfs.c:220: warning: Function parameter or struct member 'slot' not described in 'spdm_log_entry'
>> lib/spdm/req-sysfs.c:336: warning: Function parameter or struct member 'slot' not described in 'spdm_create_log_entry'


vim +283 lib/spdm/req-sysfs.c

   175	
   176	/**
   177	 * struct spdm_log_entry - log entry representing one received SPDM signature
   178	 *
   179	 * @list: List node.  Added to the @log list in struct spdm_state.
   180	 * @sig: sysfs attribute of received signature (located at end of transcript).
   181	 * @req_nonce: sysfs attribute of requester nonce (located within transcript).
   182	 * @rsp_nonce: sysfs attribute of responder nonce (located within transcript).
   183	 * @transcript: sysfs attribute of transcript (concatenation of all SPDM
   184	 *	messages exchanged during an authentication sequence) sans trailing
   185	 *	signature (to simplify signature verification by user space).
   186	 * @combined_prefix: sysfs attribute of combined_spdm_prefix
   187	 *	(SPDM 1.2.0 margin no 806, needed to verify signature).
   188	 * @spdm_context: sysfs attribute of spdm_context
   189	 *	(SPDM 1.2.0 margin no 803, needed to create combined_spdm_prefix).
   190	 * @hash_alg: sysfs attribute of hash algorithm (needed to verify signature).
   191	 * @sig_name: Name of @sig attribute (with prepended signature counter).
   192	 * @req_nonce_name: Name of @req_nonce attribute.
   193	 * @rsp_nonce_name: Name of @rsp_nonce attribute.
   194	 * @transcript_name: Name of @transcript attribute.
   195	 * @combined_prefix_name: Name of @combined_prefix attribute.
   196	 * @spdm_context_name: Name of @spdm_context attribute.
   197	 * @hash_alg_name: Name of @hash_alg attribute.
   198	 * @version: Negotiated SPDM version
   199	 *	(SPDM 1.2.0 margin no 803, needed to create combined_spdm_prefix).
   200	 */
   201	struct spdm_log_entry {
   202		struct list_head list;
   203		struct bin_attribute sig;
   204		struct bin_attribute req_nonce;
   205		struct bin_attribute rsp_nonce;
   206		struct bin_attribute transcript;
   207		struct bin_attribute combined_prefix;
   208		struct dev_ext_attribute spdm_context;
   209		struct dev_ext_attribute hash_alg;
   210		char sig_name[sizeof(__stringify(UINT_MAX) "_signature")];
   211		char req_nonce_name[sizeof(__stringify(UINT_MAX) "_requester_nonce")];
   212		char rsp_nonce_name[sizeof(__stringify(UINT_MAX) "_responder_nonce")];
   213		char transcript_name[sizeof(__stringify(UINT_MAX) "_transcript")];
   214		char combined_prefix_name[sizeof(__stringify(UINT_MAX) "_combined_spdm_prefix")];
   215		char spdm_context_name[sizeof(__stringify(UINT_MAX) "_type")];
   216		char hash_alg_name[sizeof(__stringify(UINT_MAX) "_hash_algorithm")];
   217		u32 counter;
   218		u8 version;
   219		u8 slot;
 > 220	};
   221	
   222	static void spdm_unpublish_log_entry(struct spdm_state *spdm_state,
   223					     struct spdm_log_entry *log)
   224	{
   225		const char *group = spdm_signatures_group.name;
   226		struct kobject *kobj = &spdm_state->dev->kobj;
   227	
   228		sysfs_remove_bin_file_from_group(kobj, &log->sig, group);
   229		sysfs_remove_bin_file_from_group(kobj, &log->req_nonce, group);
   230		sysfs_remove_bin_file_from_group(kobj, &log->rsp_nonce, group);
   231		sysfs_remove_bin_file_from_group(kobj, &log->transcript, group);
   232		sysfs_remove_bin_file_from_group(kobj, &log->combined_prefix, group);
   233		sysfs_remove_file_from_group(kobj, &log->spdm_context.attr.attr, group);
   234		sysfs_remove_file_from_group(kobj, &log->hash_alg.attr.attr, group);
   235	
   236		char cert_chain[sizeof(__stringify(UINT_MAX) "_certificate_chain")];
   237		snprintf(cert_chain, sizeof(cert_chain), "%u_certificate_chain",
   238			 log->counter);
   239	
   240		sysfs_remove_link_from_group(kobj, cert_chain, group);
   241	}
   242	
   243	static void spdm_publish_log_entry(struct spdm_state *spdm_state,
   244					   struct spdm_log_entry *log)
   245	{
   246		const char *group = spdm_signatures_group.name;
   247		struct kobject *kobj = &spdm_state->dev->kobj;
   248		int rc;
   249	
   250		rc = sysfs_add_bin_file_to_group(kobj, &log->sig, group);
   251		if (rc)
   252			goto err;
   253	
   254		rc = sysfs_add_bin_file_to_group(kobj, &log->req_nonce, group);
   255		if (rc)
   256			goto err;
   257	
   258		rc = sysfs_add_bin_file_to_group(kobj, &log->rsp_nonce, group);
   259		if (rc)
   260			goto err;
   261	
   262		rc = sysfs_add_bin_file_to_group(kobj, &log->transcript, group);
   263		if (rc)
   264			goto err;
   265	
   266		rc = sysfs_add_bin_file_to_group(kobj, &log->combined_prefix, group);
   267		if (rc)
   268			goto err;
   269	
   270		rc = sysfs_add_file_to_group(kobj, &log->spdm_context.attr.attr, group);
   271		if (rc)
   272			goto err;
   273	
   274		rc = sysfs_add_file_to_group(kobj, &log->hash_alg.attr.attr, group);
   275		if (rc)
   276			goto err;
   277	
   278		char cert_chain[sizeof(__stringify(UINT_MAX) "_certificate_chain")];
   279		snprintf(cert_chain, sizeof(cert_chain), "%u_certificate_chain",
   280			 log->counter);
   281	
   282		char slot[sizeof("slot0")];
 > 283		snprintf(slot, sizeof(slot), "slot%u", log->slot);
   284	
   285		rc = sysfs_add_link_to_sibling_group(kobj, group, cert_chain,
   286						     spdm_certificates_group.name,
   287						     slot);
   288		if (rc)
   289			goto err;
   290	
   291		return;
   292	err:
   293		dev_err(spdm_state->dev,
   294			"Failed to publish event log entry: %d\n", rc);
   295		spdm_unpublish_log_entry(spdm_state, log);
   296	}
   297	
   298	static ssize_t spdm_read_combined_prefix(struct file *file,
   299						 struct kobject *kobj,
   300						 struct bin_attribute *attr,
   301						 char *buf, loff_t off, size_t count)
   302	{
   303		struct spdm_log_entry *log = attr->private;
   304	
   305		/*
   306		 * SPDM 1.0 and 1.1 do not add a combined prefix to the hash
   307		 * before computing the signature, so return an empty file.
   308		 */
   309		if (log->version <= 0x11)
   310			return 0;
   311	
   312		void *tmp __free(kfree) = kmalloc(SPDM_COMBINED_PREFIX_SZ, GFP_KERNEL);
   313		if (!tmp)
   314			return -ENOMEM;
   315	
   316		spdm_create_combined_prefix(log->version, log->spdm_context.var, tmp);
   317		memcpy(buf, tmp + off, count);
   318		return count;
   319	}
   320	
   321	/**
   322	 * spdm_create_log_entry() - Allocate log entry for one received SPDM signature
   323	 *
   324	 * @spdm_state: SPDM session state
   325	 * @spdm_context: SPDM context (used to create combined_spdm_prefix)
   326	 * @req_nonce_off: Requester nonce offset within the transcript
   327	 * @rsp_nonce_off: Responder nonce offset within the transcript
   328	 *
   329	 * Allocate and populate a struct spdm_log_entry upon device authentication.
   330	 * Publish it in sysfs if the device has already been registered through
   331	 * device_add().
   332	 */
   333	void spdm_create_log_entry(struct spdm_state *spdm_state,
   334				   const char *spdm_context, u8 slot,
   335				   size_t req_nonce_off, size_t rsp_nonce_off)
 > 336	{
   337		struct spdm_log_entry *log = kmalloc(sizeof(*log), GFP_KERNEL);
   338		if (!log)
   339			return;
   340	
   341		*log = (struct spdm_log_entry) {
   342			.slot		   = slot,
   343			.version	   = spdm_state->version,
   344			.counter	   = spdm_state->log_counter,
   345			.list		   = LIST_HEAD_INIT(log->list),
   346	
   347			.sig = {
   348				.attr.name = log->sig_name,
   349				.attr.mode = 0444,
   350				.read	   = sysfs_bin_attr_simple_read,
   351				.private   = spdm_state->transcript_end -
   352					     spdm_state->sig_len,
   353				.size	   = spdm_state->sig_len },
   354	
   355			.req_nonce = {
   356				.attr.name = log->req_nonce_name,
   357				.attr.mode = 0444,
   358				.read	   = sysfs_bin_attr_simple_read,
   359				.private   = spdm_state->transcript + req_nonce_off,
   360				.size	   = SPDM_NONCE_SZ },
   361	
   362			.rsp_nonce = {
   363				.attr.name = log->rsp_nonce_name,
   364				.attr.mode = 0444,
   365				.read	   = sysfs_bin_attr_simple_read,
   366				.private   = spdm_state->transcript + rsp_nonce_off,
   367				.size	   = SPDM_NONCE_SZ },
   368	
   369			.transcript = {
   370				.attr.name = log->transcript_name,
   371				.attr.mode = 0444,
   372				.read	   = sysfs_bin_attr_simple_read,
   373				.private   = spdm_state->transcript,
   374				.size	   = spdm_state->transcript_end -
   375					     spdm_state->transcript -
   376					     spdm_state->sig_len },
   377	
   378			.combined_prefix = {
   379				.attr.name = log->combined_prefix_name,
   380				.attr.mode = 0444,
   381				.read	   = spdm_read_combined_prefix,
   382				.private   = log,
   383				.size	   = spdm_state->version <= 0x11 ? 0 :
   384					     SPDM_COMBINED_PREFIX_SZ },
   385	
   386			.spdm_context = {
   387				.attr.attr.name = log->spdm_context_name,
   388				.attr.attr.mode = 0444,
   389				.attr.show = device_show_string,
   390				.var	   = (char *)spdm_context },
   391	
   392			.hash_alg = {
   393				.attr.attr.name = log->hash_alg_name,
   394				.attr.attr.mode = 0444,
   395				.attr.show = device_show_string,
   396				.var	   = (char *)spdm_state->base_hash_alg_name },
   397		};
   398	
   399		snprintf(log->sig_name, sizeof(log->sig_name),
   400			 "%u_signature", spdm_state->log_counter);
   401		snprintf(log->req_nonce_name, sizeof(log->req_nonce_name),
   402			 "%u_requester_nonce", spdm_state->log_counter);
   403		snprintf(log->rsp_nonce_name, sizeof(log->rsp_nonce_name),
   404			 "%u_responder_nonce", spdm_state->log_counter);
   405		snprintf(log->transcript_name, sizeof(log->transcript_name),
   406			 "%u_transcript", spdm_state->log_counter);
   407		snprintf(log->combined_prefix_name, sizeof(log->combined_prefix_name),
   408			 "%u_combined_spdm_prefix", spdm_state->log_counter);
   409		snprintf(log->spdm_context_name, sizeof(log->spdm_context_name),
   410			 "%u_type", spdm_state->log_counter);
   411		snprintf(log->hash_alg_name, sizeof(log->hash_alg_name),
   412			 "%u_hash_algorithm", spdm_state->log_counter);
   413	
   414		sysfs_bin_attr_init(&log->sig);
   415		sysfs_bin_attr_init(&log->req_nonce);
   416		sysfs_bin_attr_init(&log->rsp_nonce);
   417		sysfs_bin_attr_init(&log->transcript);
   418		sysfs_bin_attr_init(&log->combined_prefix);
   419		sysfs_attr_init(&log->spdm_context.attr.attr);
   420		sysfs_attr_init(&log->hash_alg.attr.attr);
   421	
   422		list_add_tail(&log->list, &spdm_state->log);
   423		spdm_state->log_counter++;
   424	
   425		/* Steal transcript pointer ahead of spdm_free_transcript() */
   426		spdm_state->transcript = NULL;
   427	
   428		if (device_is_registered(spdm_state->dev))
   429			spdm_publish_log_entry(spdm_state, log);
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
