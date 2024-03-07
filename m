Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCF126F3E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818175; cv=none; b=dzyAIsrYdurjTNUZ/bcfMN+fupzvrMJFGb43BHfaVTb1Ci5/oFX3+co6FdYT22fNCSZOOukk6LCkPjBMFItu2aL+9Aoo214DzIxt8HmHcZwWjgFb83KLDKZrm1C6VMcIcCSmaNN65Gyi5yuSwS1aKhM+6wHDvrxW6XO8DCuJZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818175; c=relaxed/simple;
	bh=W2jcBF6K3TDmhtiHyflGL8rb62tH8Nrsiq4B+c2ncCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfO5/ura/iEFc9+qnbWgZpzVKxQpnUWU7f317ISS+CEkzSfvDWJ1R1Cn/yE/pKRfGdQHLkXVSmSqvddK30i/Vrgwu4cmj5TAabCS4vrWcLUIuvJ1VDPEbYwTadHS3EVCecHqmjsOVrh+WsSBnWgTVTNSiMBYuRKztAYyE4DASEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=dopcCq8D; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cMf/FVQG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dopcCq8D";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cMf/FVQG"
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8DAC203DE;
	Thu,  7 Mar 2024 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709812875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=995ufPHYoStp3vY9XhpwIv0iw26oqoOlOwmeelp/e8E=;
	b=dopcCq8DHNPe8ICeEoHeLstudjRVKQ0UpjccHl8ItKdvtiVVN6pYChbsIxsoaht0MuQAgj
	QC4EBQglNy0E2A0pWqIq7cphkvvnV9QzL775Xz1rkc6Evx0n2VcllQZaGGp8sEM1e84uK2
	qlHnKJlE8E9UhT5Fo8u/qJEMlw5brNk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709812873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=995ufPHYoStp3vY9XhpwIv0iw26oqoOlOwmeelp/e8E=;
	b=cMf/FVQGurSjot/sK6DzuGsCiDBO4wz0IRN/FI1cvYOvzZSVTd+3XXGQYWg9Eqk/lYojUY
	XXlITxc0o3CcRWqptJ6WgQDs4KwQGiT/BgJKzPqiqDDqNaoAvG+YqRPKwpc5fzKqhbCwRF
	c77DgF27kn2gVN2d5z3I4dJR4g+Qd/E=
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A497132A4;
	Thu,  7 Mar 2024 12:01:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 1kd5AYms6WWYPgAAn2gu4w
	(envelope-from <mpdesouza@suse.com>); Thu, 07 Mar 2024 12:01:13 +0000
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	"Linux Memory Management List" <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [linux-next:master 10409/11394] ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
Date: Thu,  7 Mar 2024 09:01:09 -0300
Message-ID: <20240307120110.31508-1-mpdesouza@suse.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <Zecmuk1OlU7VO8Bk@yujie-X299>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[01.org:url,intel.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email];
	 SUBJECT_ENDS_EXCLAIM(0.20)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 2.10
X-Spam-Flag: NO

On Tue, 5 Mar 2024 22:05:46 +0800 Yujie Liu <yujie.liu@intel.com> wrote:

> Hi Marcos,
> 
> On Mon, Mar 04, 2024 at 09:29:19AM -0300, Marcos Paulo de Souza wrote:
> > On Sat, 2 Mar 2024 14:14:12 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> > > Hi Marcos,
> > > 
> > > First bad commit (maybe != root cause):
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
> > > commit: 539cd3f4da3fdbe7dc353634e004e4b0e725c35a [10409/11394] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021440.Rs4qG6fP-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202403021440.Rs4qG6fP-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > > 
> > > WARNING: Module.symvers is missing.
> > > Modules may not have dependencies or modversions.
> > 
> > This seems suspicious. Can you be sure that kernel-devel was installed properly
> > in this machine? We have landed a patch to skip building the tests if
> > kernel-devel is not installed. We check if /lib/modules/<kernel-version/build
> > is present to start building, but I would expect Module.symvers to be present.
> > 
> > Please let me know if we need to adapt our tests further to avoid such problems.
> 
> Sorry, this is another problem due to the different way of organizing
> the files at the bot side. We are looking into this to put the required
> materials to the correct path. This report should be a false positive,
> please ignore it.

Thanks for confirming Yujie.

> 
> > > You may get many unresolved symbol errors.
> > > You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
> > > if you want to proceed at your own risk.
> > > >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > > >> ERROR: modpost: "klp_enable_patch" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > > >> ERROR: modpost: "seq_printf" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > > >> ERROR: modpost: "param_ops_int" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > > >> ERROR: modpost: "module_layout" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > > >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > > >> ERROR: modpost: "flush_work" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > > >> ERROR: modpost: "_printk" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > > >> ERROR: modpost: "complete" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > > >> ERROR: modpost: "msleep" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > > WARNING: modpost: suppressed 80 unresolved symbol warnings because there were too many)
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
