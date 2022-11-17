Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D241C8C03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 19:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77090C433B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668714790;
	bh=VyxlzGF8Ux5tupYE8jTQOkNU0S/ALFaL4uguet51YoY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nww1STOgRKTF6HxYUpv8iZfHQXySWkooO486ObGMH2d38FsAB59jVDuiLihV7Z3DN
	 mPtga7cr4Vujyb8rwuwfiHOZIGKVuF0U6kqP4iBvuYlfgjKnTF2VRAaZzEx1Jw1bJU
	 I12m/H9GoDZyfQ5dwSeCt5DGxcOdDDKs8dgjNFExDx1uEh8WLstOrtV3EpQmd92pkI
	 lajRnz7IFUmroajyUXrm5SFBUV4o9Z9bCUEql4AxZJlZTmtKQrYpsG2QZDndK9IY6R
	 JxCVTMfCnOe0CZBqw3GrNybPxtxfAo6TrrFpaUVQyGY5BKmDCczuJSGVgpuiTvKEYE
	 +smGI3nYGZI6A==
Received: by mail-vs1-f41.google.com with SMTP id l190so2646108vsc.10
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 11:53:10 -0800 (PST)
X-Gm-Message-State: ANoB5pmvymEgkcsEUnPMZfQxrTZcVmcojUfRSUECjpozkNM3GQqI+Yy8
	fJt4fQoo583qJ1dDxg2BUfEUCl/rrdDhr8Wl5+8=
X-Google-Smtp-Source: AA0mqf4PCdxcLm9InmR3w5R8+PaBiu62Xb/IM0GSQEYHwFIdLpLe/XrkCKOdiMBENYXeMVP1nDWyPxtXQ9PM/56sCaA=
X-Received: by 2002:a05:6102:3003:b0:3aa:1c26:c95 with SMTP id
 s3-20020a056102300300b003aa1c260c95mr2751534vsa.76.1668714789400; Thu, 17 Nov
 2022 11:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211180304.njhGQz5g-lkp@intel.com>
In-Reply-To: <202211180304.njhGQz5g-lkp@intel.com>
From: "Jason A. Donenfeld" <zx2c4@kernel.org>
Date: Thu, 17 Nov 2022 20:52:58 +0100
X-Gmail-Original-Message-ID: <CAHmME9pbD+DVwku2qenopwAEsccKpK5Wzqyw0Oxc-dt=cmm+Eg@mail.gmail.com>
Message-ID: <CAHmME9pbD+DVwku2qenopwAEsccKpK5Wzqyw0Oxc-dt=cmm+Eg@mail.gmail.com>
Subject: Re: [linux-next:master 7767/8605] include/linux/build_bug.h:16:51:
 error: negative width in bit-field '<anonymous>'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Should be fixed already, for a few weeks now.
