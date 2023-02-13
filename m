Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383258F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 15:35:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id qb15so30785458ejc.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 07:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JhJdlDL6fmbS5q19tX3fu+mCrdjV4k/N8ZhnKBWWqo=;
        b=YrEHHkHSWP/aZ31rFWn+zZSpmiGtwIaleIYNdb1LpJZYkm+X59+jQpGKLgfoAJ5ykP
         vQDaenf9Gvf6cdDMt+ETm7PfBUKQX0iplCpPAu0164hC5G5tc7glzUJn5EGRT/vJr+eX
         zF++HY+M37lvtYGSAugV7WGDVR9mISGinczzH5dBjeDpEqBcVKMaTtlYJcm+hvt7QHG6
         9atLNjAi6BKBPamyQx+C9TXWZLYr2i8P3nDq7LsT86h4fWz0+OBlgi/jl0CnFotWUjXw
         EIOGcDdRLIL3znItLUwERE3qd0ozFu+zc8Ghm4bppoT9l4Gh5xAWAY1fxQb0JNcYFbYU
         ihyQ==
X-Gm-Message-State: AO0yUKXXQTmhhEhLjSXMkGGcVYNR7AnYlM3bxvUzfvnIBtLXam6vnDeE
	LnP8y018IHit8k1gy3DvNfdRNZFpgFCzOpTlJ88=
X-Google-Smtp-Source: AK7set/tr7RnF5ql64ehY94/sYYKISWF6RLnIz0lIwA5Qx9zhJKZhozIHSQ9NiF+2QIYAD0HOdAMZEQ3lo83wQneLHw=
X-Received: by 2002:a17:906:d9d0:b0:8af:2abd:63ec with SMTP id
 qk16-20020a170906d9d000b008af2abd63ecmr4953094ejb.5.1676302508452; Mon, 13
 Feb 2023 07:35:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230213100800.28333-1-bagasdotme@gmail.com> <f6fc39d2060c964d32b6610956b66e8d3151d926.camel@linux.intel.com>
In-Reply-To: <f6fc39d2060c964d32b6610956b66e8d3151d926.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Feb 2023 16:34:57 +0100
Message-ID: <CAJZ5v0jhz-x+YU7h=kPM3ECGT6cqkSmbkHVOCavY4cOLaJhugA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Documentation fixes for thermal/bleeding-edge
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	Arjan van de Ven <arjan@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 11:18 AM srinivas pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Mon, 2023-02-13 at 17:07 +0700, Bagas Sanjaya wrote:
> > Here are documentation fixes for thermal/bleeding-edge tree. The
> > first two patches are fixes to recently reported kernel test robot
> > reports whereas the third patch is cosmetical (formatting).
> >
> I am fine picking up this patchset over mine, as this series has  one
> additional fix.
>
>         [thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
> warnings

So applied, thanks!
