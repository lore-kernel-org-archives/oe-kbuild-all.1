Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D3407CF0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902094; cv=none; b=VQlDFoxdvgfwycHq7UnzYeLSEfWU2h6dm2JaGYfdxXJ6MnJv+Oa5IMSANPfezoe84Ir7w4gEIM9Eb7HQr0PO74g+6RTe6kVkBP2r0LPlVxpvup33QH3mRxppTGv7UAgUAheGa99YzBjiBEhWnuyvzQVhGRLbPUeBD0AqdooAkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902094; c=relaxed/simple;
	bh=fzxoJZmoNbeyh3WjquBo7CCM0FAaACaj6ofPcVilPqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2YVZIbRJHud0GpaKOac+smaI45ac9Jb2Zswz2kQJ3D4iCpGdJRf1I5Qapzoi9bi8LpiGg6Q2qUrJBvwEDr4rAFSBl/EphOoMu17hUSi4lXgK4d2F+zWmJJl569lFDEhYw8387486Ztpx+MtL5BZadH0N2g6LAVOoFIpuKstMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DF8AD68BFE; Wed,  1 Jul 2026 12:34:45 +0200 (CEST)
Date: Wed, 1 Jul 2026 12:34:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [brauner-github:vfs-7.3.iomap 3/3] fs/iomap/ioend.c:16:16:
 sparse: sparse: symbol 'iomap_ioend_split_bioset' was not declared.
 Should it be static?
Message-ID: <20260701103445.GD12719@lst.de>
References: <202607011411.SFoYmRJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607011411.SFoYmRJa-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Yes, it should be static, sorry.  Fixed version below:

---
From b52479040dfc5725698ef396960a5a212d5a08ec Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Mon, 29 Jun 2026 14:10:28 +0200
Subject: iomap: add a separate bio_set for iomap_split_ioend

iomap_split_ioend can split bios that already come from
iomap_ioend_bioset and thus deadlock when the bioset is exhausted.

Add a separate bio_set to avoid this deadlock.

Fixes: 5fcbd555d483 ("iomap: split bios to zone append limits in the submission handlers")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/ioend.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/fs/iomap/ioend.c b/fs/iomap/ioend.c
index f7c3e0c70fd7..82eeeadac6d6 100644
--- a/fs/iomap/ioend.c
+++ b/fs/iomap/ioend.c
@@ -13,6 +13,7 @@
 
 struct bio_set iomap_ioend_bioset;
 EXPORT_SYMBOL_GPL(iomap_ioend_bioset);
+static struct bio_set iomap_ioend_split_bioset;
 
 struct iomap_ioend *iomap_init_ioend(struct inode *inode,
 		struct bio *bio, loff_t file_offset, u16 ioend_flags)
@@ -482,7 +483,8 @@ struct iomap_ioend *iomap_split_ioend(struct iomap_ioend *ioend,
 	sector_offset = ALIGN_DOWN(sector_offset << SECTOR_SHIFT,
 			i_blocksize(ioend->io_inode)) >> SECTOR_SHIFT;
 
-	split = bio_split(bio, sector_offset, GFP_NOFS, &iomap_ioend_bioset);
+	split = bio_split(bio, sector_offset, GFP_NOFS,
+			&iomap_ioend_split_bioset);
 	if (IS_ERR(split))
 		return ERR_CAST(split);
 	split->bi_private = bio->bi_private;
@@ -505,8 +507,23 @@ EXPORT_SYMBOL_GPL(iomap_split_ioend);
 
 static int __init iomap_ioend_init(void)
 {
-	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
+	const unsigned int nr_mempool_entries = 4 * (PAGE_SIZE / SECTOR_SIZE);
+	int error;
+
+	error = bioset_init(&iomap_ioend_bioset, nr_mempool_entries,
 			   offsetof(struct iomap_ioend, io_bio),
 			   BIOSET_NEED_BVECS);
+	if (error)
+		return error;
+	error = bioset_init(&iomap_ioend_split_bioset, nr_mempool_entries,
+			   offsetof(struct iomap_ioend, io_bio),
+			   BIOSET_NEED_BVECS);
+	if (error)
+		goto out_exit_ioend_bioset;
+	return 0;
+
+out_exit_ioend_bioset:
+	bioset_exit(&iomap_ioend_bioset);
+	return error;
 }
 fs_initcall(iomap_ioend_init);
-- 
2.53.0

