Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E1262FE0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140353; cv=none; b=FFP0uWrcpKiad85XLoNoJDXZ2oD4xEXIUSWYnGNclVDuC9bFL5MEpXR6h9gBnl2po3RRgA/zEAA1nPAg16vTRRC35htxjqDi1nCXceua/aWpcHvQ4ig9gz44WHaK0cl5d7CBn2WunvMNUgz7mpdyuu4LK9sGLFh7bYfMcHFT82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140353; c=relaxed/simple;
	bh=VuqnoELnEvk2Nf7UetaqLNzV2RQ+T4JbbkAsve1OGJk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nrB1XRe0YVRKk5+GTHnckUL5t4RRDSPaO/8Ufwpz8dDVx2kD0dbXmEk/NK8APLKVxr53Hi9Okd8A+I6W1FAi+BC+8hlkGdcwRd7gUW9e6HjNrFFlu+yz8FRULeyhPtNzXJRp+Tc9ADgBDpoBBsLBJpT02B/h9UcSQk7YN7SWAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=svg1gv8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="svg1gv8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7081C4CEED;
	Thu,  1 May 2025 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746140353;
	bh=VuqnoELnEvk2Nf7UetaqLNzV2RQ+T4JbbkAsve1OGJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=svg1gv8TyYx+D1i/pyZ1bCUfQxcWz+U7V6lM1fnDFppANr9sENoOQtflNVLrplWpA
	 jSHQQpiA18XTB5gpnkRXcB6p0rLY9Wo/P+PyVwsn7R0UoaygyBlyB3YmMNZtFMCp32
	 59U6z2P9phy8PaIvnyD5A+7SM4adssdgNdhYML9s=
Date: Thu, 1 May 2025 15:59:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Shivank Garg <shivankg@amd.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 272/272] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-Id: <20250501155912.fc59c6e36c87c623501fe988@linux-foundation.org>
In-Reply-To: <aBPtHlqpEsNxAiOV@casper.infradead.org>
References: <202505020405.YzD9aNCo-lkp@intel.com>
	<20250501141304.beac3e9d892495eea7a4e9cb@linux-foundation.org>
	<aBPtHlqpEsNxAiOV@casper.infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 May 2025 22:52:30 +0100 Matthew Wilcox <willy@infradead.org> wrote:

> On Thu, May 01, 2025 at 02:13:04PM -0700, Andrew Morton wrote:
> > Should this new JFS migration code be wrapped in #ifdef CONFIG_MIGRATION?
> 
> Yes

OK, thanks, I'll try this.  Maybe there's a way to reduce the amount of
ifdeffing.  Warning, contains bonus whitespace tuneups!

--- a/fs/jfs/jfs_metapage.c~jfs-implement-migrate_folio-for-jfs_metapage_aops-fix-2
+++ a/fs/jfs/jfs_metapage.c
@@ -152,8 +152,10 @@ static inline void dec_io(struct folio *
 		handler(folio, anchor->status);
 }
 
-static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
-				    struct folio *src, enum migrate_mode mode)
+#ifdef CONFIG_MIGRATION
+static int __metapage_migrate_folio(struct address_space *mapping,
+				    struct folio *dst, struct folio *src,
+				    enum migrate_mode mode)
 {
 	struct meta_anchor *src_anchor = src->private;
 	struct metapage *mps[MPS_PER_PAGE] = {0};
@@ -199,8 +201,10 @@ static int __metapage_migrate_folio(stru
 
 	return MIGRATEPAGE_SUCCESS;
 }
+#endif	/* CONFIG_MIGRATION */
 
 #else
+
 static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
 {
 	return folio->private;
@@ -224,8 +228,10 @@ static inline void remove_metapage(struc
 #define inc_io(folio) do {} while(0)
 #define dec_io(folio, status, handler) handler(folio, status)
 
-static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
-				    struct folio *src, enum migrate_mode mode)
+#ifdef CONFIG_MIGRATION
+static int __metapage_migrate_folio(struct address_space *mapping,
+				    struct folio *dst, struct folio *src,
+				    enum migrate_mode mode)
 {
 	struct metapage *mp;
 	int page_offset;
@@ -249,6 +255,7 @@ static int __metapage_migrate_folio(stru
 
 	return MIGRATEPAGE_SUCCESS;
 }
+#endif	/* CONFIG_MIGRATION */
 
 #endif
 
@@ -629,11 +636,13 @@ static bool metapage_release_folio(struc
 	return ret;
 }
 
+#ifdef CONFIG_MIGRATION
 /*
  * metapage_migrate_folio - Migration function for JFS metapages
  */
-static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
-				  struct folio *src, enum migrate_mode mode)
+static int metapage_migrate_folio(struct address_space *mapping,
+				  struct folio *dst, struct folio *src,
+				  enum migrate_mode mode)
 {
 	int expected_count;
 
@@ -646,6 +655,9 @@ static int metapage_migrate_folio(struct
 		return -EAGAIN;
 	return __metapage_migrate_folio(mapping, dst, src, mode);
 }
+#else
+#define metapage_migrate_folio NULL
+#endif	/* CONFIG_MIGRATION */
 
 static void metapage_invalidate_folio(struct folio *folio, size_t offset,
 				    size_t length)
_

