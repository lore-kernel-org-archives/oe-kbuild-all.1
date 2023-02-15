Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CE7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 16:46:23 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id u21so23212572edv.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 08:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zTPd/G13h67SQvxJF7Fd8d1Wb8TMYU9q6slWVQsYcbQ=;
        b=gfSDlMgqaEAUQcsHE7zFBvDmeTcjYBDG8IIdD/p+6IPMpmOfAcQZzUrVB6VmIWzvPX
         U1t/iUbb9ZWO411InumPfkqVPXbF0RjRlnbNL7NY3f+occ+/k7QMwwuy87Sc1rIahD4E
         LjbvVuEtX6Vgq2ZCejmIpZWR15NNOPS28wnBRQwXAMxXq0WDDzm7pI4o2gCJO5PtRaTe
         DRA01ANEJysOHm6anUz+q47OwGlRoRnDghcKNELp0dmTgtnx5OAs7gGSH7cxtYJ7HWxJ
         LMZL6ntMipz2nLBDRPOyn1sxlupCXKYq6JcSfT8RlMcITstq6Hb/WB/OIJBkkJuE4wEr
         DufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTPd/G13h67SQvxJF7Fd8d1Wb8TMYU9q6slWVQsYcbQ=;
        b=ZBmUQfK14LFRpo92Wmmp5MDVU+iovVX2FSGt/dl04/MI3O33gdeOCNlxBpZ4Ta+KBY
         foCDmtdxsatf3Tv3bWhrdWKs72Qono85DidXY64cerY+L4V+erMFmu5paD0CoJi7eVWB
         Oxo7Ma0ca2ljfi6DCNmvwxEPmIX/4oAl1e+Hb2PeUEMqgcMJbvTwscYRE27oxOinE/XP
         fjrWAY8p8crn3/AiLWYUSKhszZKstV/RV6lIyCI41rpOefAO2rrOGom1A9VPEayR/vsc
         4g8S691kg3r6sPZou0GWLjWFKtGiDdKZZ3P+t+pHc3h67ZdNesUtCw1frSkKj4gy4rIb
         6hoA==
X-Gm-Message-State: AO0yUKWulDMhwCuY+IOliNt84LljUnKL5SqWphXa3shIOaJ14wxhnvRx
	3vN/yQBPL5KU7kBd+Ek0JAmXyWXbAWr88zdKWDk=
X-Google-Smtp-Source: AK7set+sGkoZVdFmtF4qAXP8i0ZUDFHlMpTwAlohWFbmzRRZjSuduQkzODAFqzk5o4m8YYqB+MDRXgJyxV2MIWPVLys=
X-Received: by 2002:a50:d093:0:b0:49d:ec5d:28b4 with SMTP id
 v19-20020a50d093000000b0049dec5d28b4mr1468753edd.6.1676479581483; Wed, 15 Feb
 2023 08:46:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215123253.41552-1-bagasdotme@gmail.com> <20230215123253.41552-3-bagasdotme@gmail.com>
In-Reply-To: <20230215123253.41552-3-bagasdotme@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 15 Feb 2023 08:46:10 -0800
Message-ID: <CAADnVQKZ2rrhrpLMf+cRhmNEQ5rPwFibqUe0eFisL7AkY5_y2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: bpf: Add missing line break separator
 in node_data struct code block
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, Linux BPF Development <bpf@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huang Rui <ray.huang@amd.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Perry Yuan <perry.yuan@amd.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Wyes Karny <wyes.karny@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, oe-kbuild-all@lists.linux.dev, 
	Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 4:33 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Stephen Rothwell reported htmldocs warning when merging bpf-next tree,
> which was the same warning as reported by kernel test robot:
>
> Documentation/bpf/graph_ds_impl.rst:62: ERROR: Error in "code-block" directive:
> maximum 1 argument(s) allowed, 12 supplied.
>
> The error is due to Sphinx confuses node_data struct declaration with
> code-block directive option.
>
> Fix the warning by separating the code-block marker with node_data struct
> declaration.
>
> Link: https://lore.kernel.org/linux-next/20230215144505.4751d823@canb.auug.org.au/
> Link: https://lore.kernel.org/linux-doc/202302151123.wUE5FYFx-lkp@intel.com/
> Fixes: c31315c3aa0929 ("bpf, documentation: Add graph documentation for non-owning refs")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/bpf/graph_ds_impl.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/bpf/graph_ds_impl.rst b/Documentation/bpf/graph_ds_impl.rst
> index 8bbf1815efe784..61274622b71d85 100644
> --- a/Documentation/bpf/graph_ds_impl.rst
> +++ b/Documentation/bpf/graph_ds_impl.rst
> @@ -60,6 +60,7 @@ The new-style data structures are intrusive and are defined similarly to their
>  vanilla kernel counterparts:
>
>  .. code-block:: c
> +
>          struct node_data {

Applied to bpf-next.
