Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3ED3B29A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709555369; cv=none; b=OflyouFJ7L408cuma1aTlkhtv4OZQDjvhij+J9kk6Ip37hJRG1TBa1xP8rzmsbHtU4xN7aJszI6dKhDHUh+vTW1VokO3xKHvnuN5sDxNu0c1Pik9KqxUQ/EmGYF8LGXU4UvZf7P/6UEh2zhKlyferpuRuyfiTew2I3Noltmg36I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709555369; c=relaxed/simple;
	bh=PrjHc5CL08lYzU32z2CSPf/uehiEuKYK1T7ejhDZPgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZrPLrxlP2TDeanOOOf0gl2m6Qt3tfwpvSjJiZ/vgdnyh4e9c0G9IjE1D/Jar2jPGF3RZb2dDdYH7h46D2cgSEm7CEtL9y6dNN7+CXxauDW2UZKgO+zk4iSdfl3c1cT1xYezJ+1oFs2xCoCJHP8D/TNZLo1IPv0/OifgiPqCzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=g9fe9AOT; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=g9fe9AOT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="g9fe9AOT";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="g9fe9AOT"
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 064D04E558;
	Mon,  4 Mar 2024 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709555365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXhned5hFBMUFO4fhrHcAr+yHR2wDdC9OSNa1VCWmso=;
	b=g9fe9AOT93/AJ1kfcPnLk647d08j5YNSBSiTit55JteYWs7XZj3G20hyN1wgXSZvnuFcZz
	SLhPgzgp4Y0yFNQqMytwEJIr3dd6M5j29zpLCIt3zeWFifApIdgrc4Pgg3/sljIYUnufpg
	gYI3eIuPsejgTSPC8zpzrivcht+dVHU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709555365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXhned5hFBMUFO4fhrHcAr+yHR2wDdC9OSNa1VCWmso=;
	b=g9fe9AOT93/AJ1kfcPnLk647d08j5YNSBSiTit55JteYWs7XZj3G20hyN1wgXSZvnuFcZz
	SLhPgzgp4Y0yFNQqMytwEJIr3dd6M5j29zpLCIt3zeWFifApIdgrc4Pgg3/sljIYUnufpg
	gYI3eIuPsejgTSPC8zpzrivcht+dVHU=
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 868D5139C6;
	Mon,  4 Mar 2024 12:29:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id gQp+E6S+5WVFPgAAn2gu4w
	(envelope-from <mpdesouza@suse.com>); Mon, 04 Mar 2024 12:29:24 +0000
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [linux-next:master 10409/11394] ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
Date: Mon,  4 Mar 2024 09:29:19 -0300
Message-ID: <20240304122921.31671-1-mpdesouza@suse.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <202403021440.Rs4qG6fP-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=g9fe9AOT
X-Spamd-Result: default: False [1.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,intel.com:email];
	 SUBJECT_ENDS_EXCLAIM(0.20)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.89
X-Rspamd-Queue-Id: 064D04E558
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

On Sat, 2 Mar 2024 14:14:12 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Marcos,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
> commit: 539cd3f4da3fdbe7dc353634e004e4b0e725c35a [10409/11394] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021440.Rs4qG6fP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403021440.Rs4qG6fP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: Module.symvers is missing.
> Modules may not have dependencies or modversions.

This seems suspicious. Can you be sure that kernel-devel was installed properly
in this machine? We have landed a patch to skip building the tests if
kernel-devel is not installed. We check if /lib/modules/<kernel-version/build
is present to start building, but I would expect Module.symvers to be present.

Please let me know if we need to adapt our tests further to avoid such problems.

> You may get many unresolved symbol errors.
> You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
> if you want to proceed at your own risk.
> >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> >> ERROR: modpost: "klp_enable_patch" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> >> ERROR: modpost: "seq_printf" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> >> ERROR: modpost: "param_ops_int" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> >> ERROR: modpost: "module_layout" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> >> ERROR: modpost: "flush_work" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> >> ERROR: modpost: "_printk" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> >> ERROR: modpost: "complete" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> >> ERROR: modpost: "msleep" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> WARNING: modpost: suppressed 80 unresolved symbol warnings because there were too many)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
