Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18E6109
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:59:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fi26so22486957edb.7
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 06:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJEd3xf0w2y1UrC2QqcN8kYtS3GpAcL6pZcspWXDrFE=;
        b=xK7D2MQP0J8JVaXBf1SZR0vJ02phOG94ObTXezfGCTo2t5OwzfjjeXQmsEcuynmU3v
         7vMUbGEz2NAc4M3aV3mftVvqC061fVmv+2V4yRyfvlQ8r4+Oh9qUI+F3bXki1tN9ABk1
         5RRxvlC0RZuPPspTBShH7RoY7pRkT27ewFYXPS6Hf5J30lxersMVrONIeV2UtD0amfVU
         En0FPn9MG6x8Ud9r9Ygh0qfs87rR6ZyU8/8f3q+sliq5KeMJSr50JXKGMjyMfgbAxmGO
         t2t95ULeAS7Q30fO5QPPYZ6swvogqgkZcsBtVQwZ2vw+cNezTHkbup1jx065Ti6SglDq
         ep8g==
X-Gm-Message-State: AO0yUKXvFSBqF7EFNZ3W4kQWbf4cNC6pRCaoDr5yOp0xCZ1I+q2OxOle
	RN9ZY4E0oCWZBCQgHaiEmEXYoAuLMj2cH4nGfr4=
X-Google-Smtp-Source: AK7set/7Sd+0n3IR1XuI2Nft/LvrCloss5wlyYLmGs5b5V96smi/VRFv26exlqom9DfKqZS4gO42m5/LKHmuJeERXRE=
X-Received: by 2002:a50:ce42:0:b0:4ad:4c0:c4f9 with SMTP id
 k2-20020a50ce42000000b004ad04c0c4f9mr1153565edj.3.1676473183964; Wed, 15 Feb
 2023 06:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215123253.41552-1-bagasdotme@gmail.com> <20230215123253.41552-4-bagasdotme@gmail.com>
 <Y+zqKk1BTvIe5+5r@amd.com>
In-Reply-To: <Y+zqKk1BTvIe5+5r@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 15 Feb 2023 15:59:32 +0100
Message-ID: <CAJZ5v0i_+rutzGF05XdEJ5e6dN6PYegX7+0FuoaGBrvizFFS=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] Documentation: amd-pstate: disambiguate user space sections
To: Huang Rui <ray.huang@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, Linux BPF Development <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, 
	Dave Marchevsky <davemarchevsky@fb.com>, "Yuan, Perry" <Perry.Yuan@amd.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Karny, Wyes" <Wyes.Karny@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 3:21 PM Huang Rui <ray.huang@amd.com> wrote:
>
> On Wed, Feb 15, 2023 at 08:32:53PM +0800, Bagas Sanjaya wrote:
> > kernel test robot reported htmldocs warning:
> >
> > Documentation/admin-guide/pm/amd-pstate.rst:343: WARNING: duplicate label admin-guide/pm/amd-pstate:user space interface in ``sysfs``, other instance in Documentation/admin-guide/pm/amd-pstate.rst
> >
> > The documentation contains two sections with the same "User Space Interface
> > in ``sysfs``" title. The first one deals with per-policy sysfs and the
> > second one is about general attributes (currently only global attributes
> > are documented).
> >
> > Disambiguate title text of both sections to fix the warning.
> >
> > Link: https://lore.kernel.org/linux-doc/202302151041.0SWs1RHK-lkp@intel.com/
> > Fixes: b9e6a2d47b2565 ("Documentation: amd-pstate: introduce new global sysfs attributes")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> Acked-by: Huang Rui <ray.huang@amd.com>

Applied as 6.3 material, thanks!
