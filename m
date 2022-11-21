Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166E579C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 20:12:24 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id t62so13648388oib.12
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 12:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tm7cvOkNj/qBR7XO5LdkFQvaNPhHQAoivJT17A9sar8=;
        b=tSZM6W4Dwn+yp8crkKXzkiyfGweFK5Q+EEwTISTbRfhMMd95zgPpl54KKVfnhOr0ig
         JbCKyzQSGsKcc2YW3IG1UGyp6y8zjdkec8dfsyZjH41eB0o2aXsb6h3vc/zVps4HzoTM
         rw7Ho1Aer0jrluUxk51DKqqdT01yUhyAhey2GKbI2+aD+ipwR+cwf3XjL5pLPUifeQYT
         Fqo38QrNVbnk5QYDTchtY7kagXVfc6gqh/TluBLOeqwPEP9TKgSkJkhwspzQ1MTDdEYy
         e8775tqR2pIN7sBw3C5V3I/QL4MruOMZWZGbcr+zYXK4MBvGcGum8juiY+KCItfRNQGX
         0N8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tm7cvOkNj/qBR7XO5LdkFQvaNPhHQAoivJT17A9sar8=;
        b=KYeVpdFYhq0pc/S+lU+bH5AuwAI2o27RzEMqeGlMJ8bQN9m+x5tQ7c4sQuAxQgsn49
         VjubH0GitMUrCRmyypGcXZFR/Vctk11nGhVLntZnW/8uRgXAbhQYnFKKLFv3RIDuvW8Y
         i9R76hRmHzLeY5WjTbzb3PFlrUgIobrA17wtm/z+yWW8V1vOD4zwscxCeJdgIHMUnOoq
         LNPtpwt9/aI0fGS37yLu7IXIm6V3LkJQA8auSLwtB6fO0Bb2HrW93tiZbtyQsV/zZyGQ
         Vdag8kIVLRuGieIE7MYrInvv27fQvQIBlVgLIaKSUX/VCrCHR5EWIZX4y6kYB++dviNm
         ifjw==
X-Gm-Message-State: ANoB5pntR7nBeuy+qT3ZrckVUZj/BCecXGQrMw6IaeFCaJrY5ot/NzFT
	ww17vODpIteX+lH9nc1lgXHSvA==
X-Google-Smtp-Source: AA0mqf5yAVDI8P+E06yjnI1h2m3a1pn+sYmLPfgjuNe5nUkSlXL3O8MiTLdGIWdv01CCFMqW2W1wnA==
X-Received: by 2002:a05:6808:1b23:b0:354:b7b4:4d39 with SMTP id bx35-20020a0568081b2300b00354b7b44d39mr226473oib.85.1669061543036;
        Mon, 21 Nov 2022 12:12:23 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id r25-20020a056830135900b00661c0747545sm5325186otq.44.2022.11.21.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:12:22 -0800 (PST)
Date: Mon, 21 Nov 2022 12:12:12 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, 
    Hugh Dickins <hughd@google.com>, lkp@intel.com, 
    oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>, 
    GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 160/254] mm/rmap.c:1325
 page_add_anon_rmap() error: uninitialized symbol 'first'.
In-Reply-To: <20221121114425.9e2ad183c7e24f158ecc10e5@linux-foundation.org>
Message-ID: <ccaab64e-3ccd-f79b-448a-c279c6895a18@google.com>
References: <202211200135.BVP3jPRS-lkp@intel.com> <20221121114425.9e2ad183c7e24f158ecc10e5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Nov 2022, Andrew Morton wrote:
> On Mon, 21 Nov 2022 13:47:02 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> > head:   a8da2493d983a10242e6c9d71c6e828aafa5baf8
> > commit: d68dde0dc6f8b8d09357a32473db8881173b10b0 [160/254] mm,thp,rmap: subpages_mapcount of PTE-mapped subpages
> > config: i386-randconfig-m021
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > mm/rmap.c:1325 page_add_anon_rmap() error: uninitialized symbol 'first'.
> > 
> 
> Thanks.  Hugh's looking into this. 
> https://lkml.kernel.org/r/759077a6-a08-5bb0-a0b6-53be2fe8b56a@google.com

Yes, thanks Dan: Yu Zhao already reported, the fix I sent was

https://lore.kernel.org/linux-mm/7a4f5e5e-de33-dace-c526-4a3d3cf5f6e0@google.com/

but it hasn't got into mm-unstable yet.

I've not yet digested Kirill's review comments on the series (no functional
change required, I believe): maybe they will call for a v2 rather than a
series of -fixes; but let's add the above in for now.

Thanks,
Hugh
