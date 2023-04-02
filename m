Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD217E2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 03:17:26 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u10so25032981plz.7
        for <oe-kbuild-all@lists.linux.dev>; Sat, 01 Apr 2023 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680405446;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=;
        b=UtJwdvLcUzjHvS4wnr5R9NIdmpRy6wBEEas5o3BT9o69hT5Vz08J0Zuf2ICuZD9XGG
         C5w0FvFlIKJYyQ1khXc2idyl4nDJpNL2DoxFyJH5saGIoyOr7OewMf1aCDzdN+iGeSx4
         qSaeYfjFQFmhgzZOrdkQtbU4RK/VJxaiY9Ch3UYq1v74Fu+IbGNMMAjkuPlt0y6hZ9+b
         v51xxp/pM2HcA5x/PHaLiqd1ryKNaiiqWZ4VeAXrpMYYykaBQ0N4whK64E8bz7Ec0dmH
         wcwh+nUVWttKWk1D7R+85oxMlbrqFLqnpn0nLSvAw852EkPidEIcGETuo7uXBHFspkIr
         U57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680405446;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5rFwZN4arfT+quf2ScnUr6XHy1fT8u5eEhmQaaASlA=;
        b=Y278K8rQbRdL0YLaL1se0zaHJOG3hIA7W59Z9S1bdbBEUeYbVs0eevbQ0qXQr3O+2k
         NijGIob1vxPkgXkNEvkpgzBk13VKc6X4OprU4R3GAkFW6ps1DKGxSUU8p0hpo4BY09Zn
         Rc1lZcn8SypXfC4e9FzVCK8gvMG4bsolpsXSJsRFkGHpblmFOLcAsKDEqUb2OTusR29x
         Dx/oreAElpSqgRCjWKVG3rGz0a0hI38NDVZ2D5RcAFGZr2MRsTIaJdjsjHoW0a87XOlb
         kaXPTtq3ekVbbLw/l68COe80S05FrqaN2cjGoRw0f0PysPezvpaOhMiE1tZgoGRDiRWB
         5xZQ==
X-Gm-Message-State: AAQBX9eZg2DvLTUJ0q/xNY3Ek9aaUk5+NtDkGkyKlWXrV5hTEu8suEpf
	wsscyvn4jzmWPha5ZbKtiy0=
X-Google-Smtp-Source: AKy350YYP/el4R+46FhTkfdbpKa6uJ7uWQynmnEpS0NPC1S2v7kjvu2+wGLivgc7UCCGp6co5tmkaQ==
X-Received: by 2002:a17:903:1250:b0:1a2:55ca:6669 with SMTP id u16-20020a170903125000b001a255ca6669mr28198412plh.33.1680405446264;
        Sat, 01 Apr 2023 20:17:26 -0700 (PDT)
Received: from DESKTOPB5TBVBT ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id bd10-20020a170902830a00b001991f3d85acsm3989098plb.299.2023.04.01.20.17.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Apr 2023 20:17:25 -0700 (PDT)
From: "Yohan Joung" <jyh429@gmail.com>
To: "'Chao Yu'" <chao@kernel.org>,
	<jaegeuk@kernel.org>
Cc: <lkp@intel.com>,
	<linux-kernel@vger.kernel.org>,
	<linux-f2fs-devel@lists.sourceforge.net>,
	<oe-kbuild-all@lists.linux.dev>
References: <ZBzlJ36kO5KvxODB@google.com> <20230324130747.523-1-jyh429@gmail.com> <6db7be47-9455-c466-f99a-497f8fe8930a@kernel.org>
In-Reply-To: <6db7be47-9455-c466-f99a-497f8fe8930a@kernel.org>
Subject: RE: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
Date: Sun, 2 Apr 2023 12:17:23 +0900
Message-ID: <004e01d96511$a65359b0$f2fa0d10$@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: ko
Thread-Index: AQF6XO6yHRdACLHpz3GwDztUEe2YOQJb5qXHAomEG4Svrj19UA==

> -----Original Message-----
> From: Chao Yu [mailto:chao@kernel.org]
> Sent: Saturday, April 1, 2023 10:49 AM
> To: Yohan Joung; jaegeuk@kernel.org
> Cc: lkp@intel.com; linux-kernel@vger.kernel.org; linux-f2fs-
> devel@lists.sourceforge.net; oe-kbuild-all@lists.linux.dev
> Subject: Re: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
> 
> On 2023/3/24 21:07, Yohan Joung wrote:
> > Fix alignment check to be correct in npo2 as well
> >
> > Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> > ---
> >   fs/f2fs/segment.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
> > 055e70e77aa2..f4a22a065277 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct
> f2fs_sb_info *sbi,
> >   	sector_t sector, nr_sects;
> >   	block_t lblkstart = blkstart;
> >   	int devi = 0;
> > +	u32 remainder = 0;
> >
> >   	if (f2fs_is_multi_device(sbi)) {
> >   		devi = f2fs_target_device_index(sbi, blkstart); @@ -1857,9
> +1858,9
> > @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
> >   	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
> >   		sector = SECTOR_FROM_BLOCK(blkstart);
> >   		nr_sects = SECTOR_FROM_BLOCK(blklen);
> > +		div_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);
> 
> Should use div64_u64_rem()? As both sector and return value of
> bdev_zone_sectors() are u64.
> 
> Thanks,
Upload based on your comments.
Thanks
> 
> >
> > -		if (sector & (bdev_zone_sectors(bdev) - 1) ||
> > -				nr_sects != bdev_zone_sectors(bdev)) {
> > +		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
> >   			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted
> (block %x + %x)",
> >   				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
> >   				 blkstart, blklen);

