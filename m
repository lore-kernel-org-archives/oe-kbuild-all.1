Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219C10FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 09:46:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB05C218A8;
	Fri,  4 Nov 2022 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667555162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T3oPWTPozZGfEXCs6Cda1f91UWaPZeHRXFFaFekaP0=;
	b=I6wmwQbaDjeTv3pqNt8Z+6j3dBXdvw7GRjOqQebI5BBcTnn6wV4PQz+8W89nZGR70pCEmW
	eNft6JauQdLR2NiJ51yDopp0nmVDzM+OhA2/GOaZ6g5jt22P6A6eq8vxCSRMPdYnOAtRD5
	dFqIwmlWDh+SjPj215x6HX07TT26K/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667555162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T3oPWTPozZGfEXCs6Cda1f91UWaPZeHRXFFaFekaP0=;
	b=siJHrYovP5jbdGgd8LD5TTfLg9ZGb9vAo2GPaU+85u1S5yyVUerIuBGZKmN4r3H46P06Mc
	aEmbdjUS9LiJdkAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4847D1346F;
	Fri,  4 Nov 2022 09:46:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CMOlDlrfZGN1DQAAMHmgww
	(envelope-from <lhenriques@suse.de>); Fri, 04 Nov 2022 09:46:02 +0000
Received: from localhost (brahms.olymp [local])
	by brahms.olymp (OpenSMTPD) with ESMTPA id 81a255f3;
	Fri, 4 Nov 2022 09:47:03 +0000 (UTC)
Date: Fri, 4 Nov 2022 09:47:03 +0000
From: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jeff Layton <jlayton@kernel.org>, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ceph: fix memory leak in mount error path when using
 test_dummy_encryption
Message-ID: <Y2TflzMdeiXRMoek@suse.de>
References: <20221103153619.11068-1-lhenriques@suse.de>
 <202211042241.mPJd6rKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202211042241.mPJd6rKy-lkp@intel.com>

On Fri, Nov 04, 2022 at 02:40:25PM +0800, kernel test robot wrote:
> Hi Luís,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on ceph-client/for-linus]
> [also build test ERROR on linus/master v6.1-rc3 next-20221104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/ceph-fix-memory-leak-in-mount-error-path-when-using-test_dummy_encryption/20221103-233629
> base:   https://github.com/ceph/ceph-client.git for-linus

Well, thank you very much!  Now, how do I tell this bot that this patch
isn't targeting this branch?

Cheers,
--
Luís
