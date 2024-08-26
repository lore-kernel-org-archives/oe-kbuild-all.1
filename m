Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AC19ADA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708211; cv=none; b=RM8til6kZZI6OoyFLzpSUL0rxC1rltoki+PuiNx5TndCqAKvAvgpNkcGZrLIZCkeDRO17DEZtk+I8wlr6yvYWec1IUwiQSkbZG5rJFvmQmtrehOhqbaA2IS6TeyJPiLwGbvZvL25AHpHNqFhtol/j9WYoz9y8P8gv1hoIXt/lhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708211; c=relaxed/simple;
	bh=GYfQ2aJ6+j6KIn4wswZK8fwF1ipJKIXjPWzU4CXaGP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgXdNy0IK1RInD5FDNrTGYw2ML7hTQ/RXTcmtsA055Ltlx5Zi8gvuZDRnHKhQ0SPEtYO+O3tdPUyQAaKiAZNsTlihF00ZbPp68PMD990tzgHuie3mp3nQ8xJl9ocusO0wDqh6L2WMUk2J4zSoITiwwZaZEZZkNaAVjEinvYUpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ey2gx3xl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ey2gx3xl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso1877528a12.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724708208; x=1725313008; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrXFFnRr4yU7Etmc4wy+t+cJrIu15SH8enM9SvrbiKQ=;
        b=Ey2gx3xlnY+i9C98fpzB+nJwVMk6jsgHMfcwAe181ZMuDwAQNoS0ubdj47p1/Injgd
         d/E/4Aui+oNpxGldXp94Hp8BBsgOWrCiuIfwQSTLzJML16o2OlLoYbd0+5URDaBUnkAv
         QALmxFGVqcgkYq8p/lWC+EJhcEhDfXW1uPoWZb2B7HnfYKrQnhSWQDPDVhTCK2+mLaoh
         EMmxEFF61m7XrLCar0G8hA5ITvQIx+DY+e71Bfv59OaPwAOwLfmJb3ohmZAAUzoYEpvH
         LJQ9NpK0V81odmQDKOT26pGLWsQaJ1ND4L3ojhEa5sip4vcJju2HyzELnjwR0EL/OewX
         EzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724708208; x=1725313008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrXFFnRr4yU7Etmc4wy+t+cJrIu15SH8enM9SvrbiKQ=;
        b=sILRQJxSwtt6lOWc1DnwtlQ/Wj+FAwZSyCr/HfOJCtUDlJ3tqs2oqidNYLgwcKmXGq
         9OEF1Hz/8ru8hyJ/ptMCs5NfGO0Bx/m2EFDbCxjl0jfnRAwWJMJuXeUbRGLa3N1BS2vV
         rFjmtOAXHxQK/pa9IgSY+lgfi/OLOq4KXTquM/oeZl5rwWgJ+WzSBxAAe2Dg6zFVtqlQ
         Fziwp0VKr+Xvp87xuOD0QleaCcXZZe62pf5l46zo4k5hpGX0QA8aUDXXrk/Zz0W+WEtg
         FaF6U36pneWcwBAM/4bK9AucTKSNPBvx2xsn/+IL1YGbnCtOuHMwtZTlC0a2JhPcW1AR
         VjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwxfjWlcvcuM/lraMbMdmqYlBtMR0vOx+Xpnri0fktFp40wjZhw8Y9DI6o7w2HRhe69IF+V4EQE1vM2r4W@lists.linux.dev
X-Gm-Message-State: AOJu0YxMNyY9CxWC4drxVekR17iBt6FzINyjOZ2x1AnoX2duey0oNgeE
	BQPQ3FqeFZkR8E4749UbNNIHhx45XLO6+1m4UADNWTxgVG190kpEeyKYZ9vbopQ=
X-Google-Smtp-Source: AGHT+IFDd3BFQ04/0ytE5hJOoHnNG49Q5+Iezc5rR48h02qI4ikRCEhCnfwG37487ZRj5/YBze6HTw==
X-Received: by 2002:a05:6402:84b:b0:5be:f1a7:c2cd with SMTP id 4fb4d7f45d1cf-5c0ba312cc8mr388408a12.31.1724708207427;
        Mon, 26 Aug 2024 14:36:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb48106dsm218224a12.79.2024.08.26.14.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:36:46 -0700 (PDT)
Date: Tue, 27 Aug 2024 00:36:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild@lists.linux.dev,
	"Martin K . Petersen" <martin.petersen@oracle.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Avri Altman <avri.altman@wdc.com>, Bean Huo <beanhuo@micron.com>,
	Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier
 to read
Message-ID: <48a483e2-6a20-493a-80d8-7292c96aadcc@stanley.mountain>
References: <2d3d17c7-c3f9-4596-aa50-3226163242eb@stanley.mountain>
 <602421aa-d546-49c2-a08f-6779d3c0f9af@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602421aa-d546-49c2-a08f-6779d3c0f9af@acm.org>

On Mon, Aug 26, 2024 at 11:05:47AM -0700, Bart Van Assche wrote:
> On 8/25/24 11:25 PM, Dan Carpenter wrote:
> > New smatch warnings:
> > drivers/ufs/core/ufshcd.c:5484 ufshcd_uic_cmd_compl() error: we previously assumed 'cmd' could be null (see line 5474)
> 
> This smatch warning is a false positive. There are multiple code blocks
> in this functions that are guarded by if-statements. The two code blocks
> this warning applies to are mutually exclusive. Hence, the 'cmd' check
> from one block should not be used to draw conclusions about other code
> blocks. I will consider to introduce the 'else' keyword to suppress this
> false positive.

I thought that might be the case, but I wasn't sure.

If it's a false positive, then you can just ignore it.  All old warnings are
false positives.  People can find this thread if they have questions.

regards,
dan carpenter

