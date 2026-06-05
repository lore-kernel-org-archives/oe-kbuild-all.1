Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898C4B8DCC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657465; cv=none; b=SPRQnktDh/84HuQLgjRU7FV/HIoXMn6cYdPA+6SXe5gA32YaYXKPlihJsxzCXUQ1YgbrPh7k8T7dxJLFSNUMI8r964PerN1kCWvhnAjBr6rnzYz810VVYM5yV8vzcOd+vW9LgzEZzfNQD1kouv4BJNL+849rFjjsxdXj5U/uDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657465; c=relaxed/simple;
	bh=qdBsAaDPYWQD+o4KY7FNoD9E5UwBIxVV+8XSjmrPl+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FP5wY70MjbgsRsWQypyvyIWA+qy0Zmq2ZVMmbrQEH4A4aOeULbfNgukK5DV8gHu1MLAYDYQJ4Q3lgbSLlgNXzG4q4o29YaLxVBTA6FFDmC4UI/DHG9ngYkaIqGs4JghPfiJo2NMnT+Gm4C4txK8aAWLaVUAaDnm4SDzpEk11Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evKKfC1P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evKKfC1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780657463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDpGUWK1jFLOl+N0OUU04EAzR93Ylg4HoOdQPQsg2R8=;
	b=evKKfC1Pi02ytiHKk2WfAWof61CbEIV9NYdED0bcaHZEqUZEAVC3tpXzACIe5kJc3349aU
	x+3moTOTQlQ8/WdIePZUUmkGLmnsTG7EfVptHXJBP9IDSBngY4TlBCOT+0QQDcOGjii8le
	WD5zWm/BZr3O5KsRLzNqGmX1yVW58JE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-_sWn9LopPtediO5EaP3Erw-1; Fri, 05 Jun 2026 07:04:21 -0400
X-MC-Unique: _sWn9LopPtediO5EaP3Erw-1
X-Mimecast-MFC-AGG-ID: _sWn9LopPtediO5EaP3Erw_1780657460
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4601102c30dso1059432f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Jun 2026 04:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780657460; x=1781262260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDpGUWK1jFLOl+N0OUU04EAzR93Ylg4HoOdQPQsg2R8=;
        b=O+rLprKeNxRD1TudpFsIgbwaHLKDAPhj3+JwvWViikVEfDikp9A+UdxvSvMrdwZU0F
         46vfb3H2r+ujzP5QOxNs/e65zOT935kNY8gDlykutJ8dEeykn97zeHPD2FRnhfsUkxiA
         Flfv/Ym/ZJh9zMEovgC9lDKYtIChQCIjCOeFHssew3eK0dQIsc4eRRT13Ee3zXAnppIi
         tGV27hi1XR72Z/g8ILx+uyb9T9SxfC4zcYO1EuaWwB2rQsacOiWaVCaDFZrN4NKT3aNC
         lF1IRuAdTE6YJTZO6RnCGhjbW0vxhHqLVWnAKcS7LDrmvQG/4Kc0wnaAsC7tVaaVmnGq
         gcGA==
X-Forwarded-Encrypted: i=1; AFNElJ+s5Ack5BBDq//plIyAZNqAyNzPqAa2xaZFMCrOT8ACm74i8+ixWGu4WTdFAvByXTUEZAQlv5UfydZg1XYr@lists.linux.dev
X-Gm-Message-State: AOJu0YwbYj0iQ+3347NFQMfHXy50p1wkPZJ/kUcldzZ5b6R09MgoCeVI
	kph4D7vNR4uDmd8nii9jBv0cIRFq1kUxaoMwbhZmy+08+bZPrBVajOsWlFzqJP3PoASwdZbP7zG
	TdQsHtMUPMrxUrBdoQE6Se3Pg1vn8VTH7Gt2TkECsEgZl2PL8QfB/RdGFnRPYWVTfLQ==
X-Gm-Gg: Acq92OHE/Rog8F1//yGiP2q8bKnGtRMXRVX4UMcbsNPJP/DHH4Dz2yKWNZU6lK3G7sG
	Ce7HLZw4A02/Lhjr5Tts/ZLRjkiP4LmrJIpBrwOItG5gPI5McOpADImgD+3WFA2h67GBEmKCui7
	XpQDqxEdnRgA8lhAkk6zpTzjr9eby3bVUUDjL2hQfEqn1s1oC+LTgQyh1EgXPDXc9mJJTos41Fq
	9fOhkRk0xYZWVEItCGD1Q2upJWhI8GkKqIfw18XfC916+tw7MFuDM1grF1Af41eNNstCUe5OtzT
	KZMakkckQ8SEd2A9wG6zrDEK4gbTC9bpmF6A5Vtp22WNdgiSz6kgE6oFLkHe6zM1PL+O0oyTOJY
	rFQGZqsYQOEaYrMcjmUzDKiaqoXoM6nBz62G3nV0QMBfaO3cgmgug2RaUpmsmAauoQT4=
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr34299095e9.14.1780657460358;
        Fri, 05 Jun 2026 04:04:20 -0700 (PDT)
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr34298195e9.14.1780657459856;
        Fri, 05 Jun 2026 04:04:19 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm133071655e9.2.2026.06.05.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:04:19 -0700 (PDT)
Date: Fri, 5 Jun 2026 13:04:17 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <christianvanbrauner@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, cem@kernel.org
Subject: Re: [brauner-vfs:vfs-7.2.iomap 6/10] fs/iomap/buffered-io.c:577:33:
 error: implicit declaration of function 'fsverity_fill_zerohash'; did you
 mean 'fsverity_file_open'?
Message-ID: <aiKsT8Xn1v3QA0I9@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <202606051818.Y3MWKSfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202606051818.Y3MWKSfv-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IvAWhzItny6RYsYoyoKTimDBishBAB3acr2euLH05Bw_1780657460
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-06-05 18:49:51, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.iomap
> head:   7cf86a52cd64d21a9511f2659cb87d3aab2cc1d4
> commit: 014c8fc41d92d1c48e9c08cb92ab3761f4956d4f [6/10] iomap: teach iomap to read files with fsverity
> config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260605/202606051818.Y3MWKSfv-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051818.Y3MWKSfv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606051818.Y3MWKSfv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    fs/iomap/buffered-io.c: In function 'iomap_read_folio_iter':
> >> fs/iomap/buffered-io.c:577:33: error: implicit declaration of function 'fsverity_fill_zerohash'; did you mean 'fsverity_file_open'? [-Wimplicit-function-declaration]
>      577 |                                 fsverity_fill_zerohash(folio, poff, plen,
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~
>          |                                 fsverity_file_open

Oh, this one is defined in the [1] which is fsverity patch. The
fsverity is probably has to go first to make it build.

[1]: https://lore.kernel.org/fsverity/20260520123722.405752-5-aalbersh@kernel.org/T/#u

-- 
- Andrey

