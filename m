Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62D2DCF70
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682423; cv=none; b=NJUCU3/sPKmO1TmVtFNwRbmEg5J5P477Lyw4Hqk6UojSE/TDe6mJJiflaqNWMnkpMKDlA3wmLsnvLy2qpkMT1E0gYKDf8HjfRaX3y7yzLAs7v2/DZ1Fof7jWIrI3BETBQOTxb5EwLlrUNvB0sbA2B8GdmpaUsevtWoYxBnfpQds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682423; c=relaxed/simple;
	bh=HbWeIT+jA4hjhJwyfV83Luo/UR3MkpPBEH6bueMs7M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed1+8fLNSWQoKDqsxcjEdRJ7PC3TuAbUMmTUV/PphpdKwy6rmYIX0BzWxIOTPClUPDUVonV0U+I44QgZRaFUFhkMKptMAVrfcAD3AOjs64Qn5Ozx83XIeGwJpX5Hk2iP0ayBwYkjumHnILQBeTWDUHN5xS/s4Ro8MCFH4Hk69w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eiODSEGd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eiODSEGd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so884029166b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755682419; x=1756287219; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUtGYQFblf9pQrLVu24aMqFiXE6ucdsRYulZCvjWiao=;
        b=eiODSEGdvepdiMlMsYTIzJF6QCMX0iCIFyDOTBrJ5/KShcwItQHRxTHNI/slNeJ63h
         aSq7mKvux1KFZkb4VRnMLDfYyIsyCGn+v/JgbbeQYI31RCASuWSy90D5AyvlBYF+yZ+9
         xoZDntxYrotXE1RTxyyyhwcQVxoICUJXsdMdNdVD/iwZmYWCcEvuPCOTehUVZ4Pt/Jh9
         7zfvz0QTbO4D9WVjbniyPu7ZhnEFOhWuN7ilKy11jXCW3JyBTyNG6FIBmDVKSPIIy0Mc
         TDF64DUASATWJXb+9nomlbriLOoU35bKON1XOhI8VzH6g8enm7r53anSIK0ZxeWv3+SO
         9mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682419; x=1756287219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUtGYQFblf9pQrLVu24aMqFiXE6ucdsRYulZCvjWiao=;
        b=c3bVdYTXIrOvhpidcJoABBRVD6xSquRYWhjBSoD+L89iyLRlzfoseL8tC7hVUBZCqa
         qDgzsyC0IqTm5AVf7QU3TmhcjOEpp7iFuZeZFxf0h3wj19BUp3mm0wvZUSNU5ubKlXgF
         fJqSAMjWKhv4VtbxkTrHE4AHtSLvR3saor4mFJdJBnR9z8UGNXq5Y6897bm+oDIJd0Rd
         h928tha5MaxK48QqsHDnCNkuZ2FxXVcEM1RN2UDSGK3emN/Wa2AGLflJWsH3bqyBuxOi
         TllNjpKEgBQSjrAsqf0BAsRIPUsFms6H19wug4c2WksVrTYkYGujxd5ohFKIaMpUCS1q
         hPdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9O4gth5F9ENKIjTMDgIoczjLgWROso0OiDzUlmFvxvB1YrjNTi/H1Oea0iQQuG7W24brLSwe2r2E0KGic@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0vYPJssdR7PgJzGA27IO7QmMqOnxCBR3VOsy8wejxzAqJD8uT
	ppEvJLt8OI4zgHYC/MbhBkJnq5oC/cUK03b48N2j9ifIa8eDz8tPonf0l9cbkWGt21k=
X-Gm-Gg: ASbGncuPwFZzFMnAt2uUzbKec0bhKn59I5rrty+YQtvMDxbNdar+ntPzIRme+aROu10
	geOEFFeXXy3IdgLTzPFtVLS6LsyXcUs6yOl/SUkXO7ScJ2VTnRM0F585u6mpNGJOuHgmBsXAgp7
	96A64rspeBcoHC14OS7iRg1hhrcjnY2Rli1aiTVvoeO0/hM6e+lPJFhAhnpELEvHN76CYLPRhRn
	qy2qfUOH5gHK0Fp/h3yvhQuX/twNB9CgcKDGQyCWahcF9pBbSbdVf/G+vpbG7eg0Vk6GFNxVjZ+
	eAQvUuj5R67SJEY+xGG7hR6ocob/BCxlReWDaIJSpGFG1r2gOUyQuKByAFsFHPRzNVqJoO/HVq+
	EA74WYaJ3kU/NKWOj2JUBBou06fIOkTkRzJJ1
X-Google-Smtp-Source: AGHT+IGXHe3+t3BEKmunC18D/1Y6ekjPUy9xaq9clkZufAl4R+B2NGg/Uju7EdG3WK9qHxpL/vyc6w==
X-Received: by 2002:a17:907:3e8f:b0:af2:5a26:b32a with SMTP id a640c23a62f3a-afdf01b27bcmr193049566b.30.1755682419377;
        Wed, 20 Aug 2025 02:33:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdfc4bfe65sm12791466b.85.2025.08.20.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:33:38 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:33:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	paulmck@kernel.org, john.ogness@linutronix.de,
	kernel test robot <lkp@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH] panic: Clean up message about deprecated 'panic_print'
 parameter
Message-ID: <aKWWcPOf9qPIoCe4@pathway.suse.cz>
References: <aKRJKZHgcxyNF3y7@pathway.suse.cz>
 <202508200907.PsZ3geub-lkp@intel.com>
 <ae9bb2ea-c6e5-4a4b-ae25-aea1d6fe084d@linux.dev>
 <33a897b4-7d9a-4641-9c7a-07c19bb9cb6f@linux.dev>
 <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>

On Wed 2025-08-20 16:57:48, Lance Yang wrote:
> On 2025/8/20 09:56, Lance Yang wrote:
> > On 2025/8/20 09:54, Lance Yang wrote:
> > > On 2025/8/20 09:31, kernel test robot wrote:
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > > > > kernel/panic.c:952:2: error: call to undeclared function
> > > > > > 'panic_print_deprecated'; ISO C99 and later do not
> > > > > > support implicit function declarations
> > > > > > [-Wimplicit-function-declaration]
> > > >       952 |         panic_print_deprecated();
> > > >           |         ^
> > > >     kernel/panic.c:958:2: error: call to undeclared function
> > > > 'panic_print_deprecated'; ISO C99 and later do not support
> > > > implicit function declarations [-Wimplicit-function-declaration]
> > > >       958 |         panic_print_deprecated();
> > > >           |         ^
> > > >     2 errors generated.
> > > 
> > > 
> > > Oops, panic_print_deprecated() is defined within the #ifdef
> > > CONFIG_PROC_SYSCTL block, but it's also called from panic_print_set()
> > 
> 
> If Petr is cool, @Andrew could you squash the following?
> 
> ---
> Subject: [PATCH 1/1] fixup: panic: clean up message about deprecated
>  'panic_print' parameter

The patch was malformed probably by your mail client.
Below is the fixed and revied variant.
I am going to resend also the squashed version.

Here is the fixed followup patch:

From 35ded31e9ff2c9925d7a78472115c9929b582c63 Mon Sep 17 00:00:00 2001
From: Lance Yang <lance.yang@linux.dev>
Date: Wed, 20 Aug 2025 11:25:31 +0200
Subject: [PATCH] fixup: panic: clean up message about deprecated 'panic_print'
 parameter

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508200907.PsZ3geub-lkp@intel.com/
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/panic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index d3907fd95d72..24bca263f896 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -77,6 +77,11 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+static void panic_print_deprecated(void)
+{
+	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
+}
+
 #ifdef CONFIG_SYSCTL
 
 /*
@@ -122,11 +127,6 @@ static int proc_taint(const struct ctl_table *table, int write,
 	return err;
 }
 
-static void panic_print_deprecated(void)
-{
-	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
-}
-
 static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
 			   void *buffer, size_t *lenp, loff_t *ppos)
 {
-- 
2.50.1

