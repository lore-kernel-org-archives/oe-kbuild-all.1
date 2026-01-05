Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AE56B81
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657556; cv=none; b=ObyCG9XBvnd7QR/gFTyLyumiOLOFs3NHsxSp3mbPv8uya3gYoleNlsXH9ip1CtmUXEwEwDD/WljKIj2yZwbujzkrllxE9Ch5e9ru0qROYgNgyiF8cXFfLBdMP9gv/tF0szonwEutt5HLTZ7klHmoAX09MdRLbuU4aYz9RmZBuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657556; c=relaxed/simple;
	bh=vydIrr+Gml+SlvhYbGq0p6Gx/f1mOX2506u2ezdMwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPSr/f/v9olbypYJTDKKJQ5xTcsRFMN9vYkgGEImLPtUCgBaCL5m8RbjuZx4xLxfxDQVo8zFJKGAB++GoA9A7Oyb6d/CEDXbvMTSb7hqroVpCV91XMxEC9b3NbsrlqLOA9F+QFOpgspuLVXVttX6MX6LnZzMP9aeS15mg2NaOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRjeeu1/; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRjeeu1/"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0eaf55d58so12581025ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 15:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767657554; x=1768262354; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Td42PUfrOWAuQeqqyPhN9snX5r+zsGZdxP+4d36YAws=;
        b=cRjeeu1/JRKQoWoj6EsKCEslfmWoOGUYVrDtreCl9rfFgOfAIKBvyAtfKPk+TkOQt/
         WwZVxzu02bGpgGDl1hI7OPlnvNY9Uk5/HF+1h7FlEAuLh4nhtnhRyVBr7SH4E+fbeE/+
         X7LH0PtYRU32xpeD1xvAA0k7Hj/6gHrwJQOT6yjWb2vvaCli2axrbPKSsGIUQ4ozk7ng
         Dj6gl7XSen4B+P3vmgtrMTvcmBxw515dTeZDRxxCZWilu0OspZLf7mZxQlWAstJNte0B
         8AL03rtV3dYP2GJ5LF7yQ3+LPgzuJq+xh5WzM3kYxpAUZ1fI4D7o6VCmFUmMzzu1jLW8
         oJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767657554; x=1768262354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td42PUfrOWAuQeqqyPhN9snX5r+zsGZdxP+4d36YAws=;
        b=mudT8ScVwWahqLsDYoPnlKW+yAARG+i8MQI9Om3chbzppagYMNs/aWskDvdW/b/B2k
         Jk9dJub0DEkYcNO5HwzshRwkE/NZtePjoKv4wx2HBRhskYDY/rw1/iOeIKh3KnSF25NE
         +r6N22+2W3fOAJXcORMJ1euSj/PdUBQW4/g7bx0yCJly/N1Bu241QE+z6eMTkOln5+K+
         sb5Qo551eEVy01vIuKqK7G+nYJN6aNYgw2zPrBhrUYXixiwS0DsMQ8oKVBr+86f327qA
         fcVES1FZ0cQeP4k55uheyoHvosZYBUOYvP/UNwKXgAhIEgL+l4xizEQi4IHhYeLTebv/
         Vg5A==
X-Forwarded-Encrypted: i=1; AJvYcCWH7RRCcfTjvEeSi3z6NSpqrFzmtL3YYTEMYS7nzIynOeFvT0CrnJCjrlrYeH1CzvNkVP249e/5oL6mPh4U@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ20eoElbH7ul7hDod0UfEi1LTTU8cp8feZyf9lcrN2K1MmKVK
	fMC3LOnKPv0uiXEhC/2o1qBlj7GTV2MmUb99uOWPy8znyv/D19pwep7c
X-Gm-Gg: AY/fxX5FZJnd+f9SX3SV/bUrKQMGvIoREkOlffu5d+/RF+Be2MkMb0wJdQ0gDVmzOb1
	B3f8kmEzK4yhCFPyPaYAjtxTygdaaUlYe2yUCvxMaCFWuskvngzKgGHFK9RhodF12Rr4wVrGVl4
	hIMZoxCTbGzchdYxWSA9d6yaCib6w08ACzJ+hgFdcqEHuK2H+DLDpQ3KgspDRvD7igU13g5lMoC
	gW4oe9dC6XoOr19DzvqFsALOt8Khk7cwR96W69lHIyLtmz2ZadoF9a6bz6/k0DvdJGdpPwG2gWf
	Mmhut2snlvXYgR4VY4mPVMAYPhzhD9rgkSWv0ZpWacPrQeB5Vo6770Mmv+5NnmCKB+0r1+7N0QC
	uQsa1dRU7agdFHYBF523AFdzRKG8ny5MHL48nlGNaNKX6PuoQX1PAHtit9l+WP1IJ/Odo7T0upR
	SLlNJKJnx2N8u29V6WubH5ZsgXDqySvp8pFw6Eior8p1sZ7mvLgHgvYWivrw==
X-Google-Smtp-Source: AGHT+IF2yujLQdtPUNjYNIQaaHVruUByq90dGhW9WF1ysuwMpC9YYgi0f8b7TmopRm+oHlRb0Tf74A==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e80e:b11c with SMTP id d9443c01a7336-2a3e399ed7emr7963145ad.10.1767657554271;
        Mon, 05 Jan 2026 15:59:14 -0800 (PST)
Received: from localhost (static-103-70-166-143.unpl.net. [103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm3044455ad.75.2026.01.05.15.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:59:13 -0800 (PST)
Date: Tue, 6 Jan 2026 05:29:10 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, 
	Benjamin Coddington <bcodding@hammerspace.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <aVxP9K7mNMw-yChE@kforge-fedora>
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

> Benjamin,
> 
> On 1/1/26 5:27 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> > commit: 977de00dfcf87e8d95f55dfc247955dc2f9da14d [1503/2671] VFS: move dentry_create() from fs/open.c to fs/namei.c
> > reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011410.4vVaIDB9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601011410.4vVaIDB9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    ERROR: Cannot find file ./include/linux/dcache.h
> >    WARNING: No kernel-doc for file ./include/linux/dcache.h
> >    WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
> >    WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
> >    WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
> >>> Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline emphasis start-string without end-string. [docutils]
> >    Documentation/filesystems/api-summary:56: ./fs/namei.c:4943: ERROR: Unknown target name: "o". [docutils]
> >    ERROR: Cannot find file ./include/linux/buffer_head.h
> >    WARNING: No kernel-doc for file ./include/linux/buffer_head.h
> >    ERROR: Cannot find file ./include/linux/fscache-cache.h
> >    WARNING: No kernel-doc for file ./include/linux/fscache-cache.h
> 
> fs/open.c is not used in Documentation/ (where the lines were moved _from_).
> 
> fs/namei.c needs changes like:
> 
> ---
>  fs/namei.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20251219.orig/fs/namei.c
> +++ linux-next-20251219/fs/namei.c
> @@ -4938,7 +4938,7 @@ EXPORT_SYMBOL(start_creating_user_path);
>  /**
>   * dentry_create - Create and open a file
>   * @path: path to create
> - * @flags: O_ flags
> + * @flags: O_* flags
>   * @mode: mode bits for new file
>   * @cred: credentials to use
>   *
> @@ -4949,7 +4949,7 @@ EXPORT_SYMBOL(start_creating_user_path);
>   * the new file is to be created. The parent directory and the
>   * negative dentry must reside on the same filesystem instance.
>   *
> - * On success, returns a "struct file *". Otherwise a ERR_PTR
> + * On success, returns a "struct file \*". Otherwise a ERR_PTR
>   * is returned.
>   */
>  struct file *dentry_create(struct path *path, int flags, umode_t mode,
> 
> 
> Or                         &struct file \*.
> without the quotation marks.
> 
> -- 
> ~Randy
> 

Hi Randy,

I have already sent a patch for this here :

https://lore.kernel.org/all/20251231153851.7523-1-krishnagopi487@gmail.com/

Gopi Krishna Menon
