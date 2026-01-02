Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A493155A5D;
	Fri,  2 Jan 2026 03:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767325491; cv=none; b=cL+7r2ZX0dNFejQ+pbGxvsyZkQC2QQW5YmRclmMeem6Bmrnao602ZY2IXj0fNyVoxDAafS7vaiSOgSAVjjzEc6Lqy0H/HwGLpcfWldob4he306ICv+M3ilTf87/8yH+BROWapk95W5SlYs2RnmHeTRlGCGMLPjBRFexBq83DDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767325491; c=relaxed/simple;
	bh=0xrXZLtn3N4X1QSQnC5Enw0HBWGlo/dm7w3MBtL4jwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcaCVv5HNzfMY4MvzuqVQPQZxFGXW3iNTqZMz6NtPU2Pb4dcSGkrb3CQkPzI7wLVRJ/YKBj6Q8dercRzhSVPKGuxo6BUJrr3LaaOF60rc/wJN7ysWK0aItQDmCyxJI15VU1h/kC1nUgF1mj7IFhXH4YQ9kkC6WwL6FBUM0zfgYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gOzZOtbp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gOzZOtbp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xAm726XJfsYmJYLMiHzmbG64ljYGLESddLjLiMTuhes=; b=gOzZOtbpD1GZKNx8skDDTFjB9T
	8qXx/2wC0Pm0iIQecbk1WXt/TLdyI2fOykEeIQJivIe67YJUintqRT1I4Lon+Tjdbmj8Aas0ZdHw4
	2B1EMfxp+bzT2y7gkD/QOOi0UsmmzZfQxRmlYQCbqncDU5AvaP6+yQRTPSCYqE1zH8HJiYaxdGeT3
	sLC7Vwg5VlaS509yYvdN369FhuuBkU84LVWIHGx3TySsU//2v9cG5Q3S5s7KFrh8SbniorUdQ0TF9
	lbFFEEkn80i53abAhSDj9f+pvZzmHW934ZqP6CQ3Jj4t4KqmJp7Qy50vupqmHHpu6ZYAG+bYf3e/l
	iY4ZrM8w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbW5j-0000000629F-41xs;
	Fri, 02 Jan 2026 03:44:44 +0000
Date: Fri, 2 Jan 2026 03:44:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Benjamin Coddington <bcodding@hammerspace.com>,
	oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <aVc_KwkNGsPxS5jT@casper.infradead.org>
References: <202601011410.4vVaIDB9-lkp@intel.com>
 <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>

On Thu, Jan 01, 2026 at 07:36:48PM -0800, Randy Dunlap wrote:
> fs/open.c is not used in Documentation/ (where the lines were moved _from_).

That seems like it might be worth a patch?

+++ b/Documentation/filesystems/api-summary.rst
@@ -56,6 +56,9 @@ Other Functions
 .. kernel-doc:: fs/namei.c
    :export:

+.. kernel-doc:: fs/open.c
+   :export:
+
 .. kernel-doc:: block/bio.c
    :export:


... of course, then someone would have to check it didn't introduce new
errors, so it's a bit more work than that.  Perhaps you'd like to take
care of it?

(and don't we have a script that flags files that have kernel-doc that's
not included in rst files?)
