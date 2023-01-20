Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86576BD06
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 02:27:57 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id h10so2919104qvq.7
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 18:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvsGjt1TAervY/9r9whUOchjkA3fpkAqZ5KfexO5OlM=;
        b=qsjDsxNvUQyD2iPKi39vD8h5yq5WK0pVuus8A6QST2ZAYgD3RULVkbIu/J/qDAgK2j
         Mt7L1TCo49tVUBJEsIc3+dav5bj+0Tx5OmGcjIDqpLJPHJOR0sMZneb9EJrcbXc11Z9+
         JPrFwavqgckk3ZPRKN1FVUGT30XHEaIpXVLsjMkb7W3O2tIpyWhRtbg+jyCCyxrBmHn1
         rMe5trDBDPlldDM8JxfVf0JUHYYFJXcLIFh3F8aS0CZ9VhkUUGDK+InDFBN1s/w7tkz0
         szANRyzmqWTI3wVAA4VcLW0FId/mw2mOGyYlAWYEmfZpWJq4RAsmXRX5TK/NZ6IbSrpZ
         u81Q==
X-Gm-Message-State: AFqh2kqMBRTpkuGN+avfcjAFcoETIwnIGhrC8w1M8YM+rZSN4c82u+YM
	pXRkdcuI15pOCU3913QzhEs=
X-Google-Smtp-Source: AMrXdXsTN+AMAuZutGyVWEgzounRZKk09Nm//4Ihv0XXf4wK7/xnmZ8yLD8V3BsWGl79zb3EHRHtgA==
X-Received: by 2002:ad4:5893:0:b0:535:59ca:6c6b with SMTP id dz19-20020ad45893000000b0053559ca6c6bmr4639033qvb.19.1674181676320;
        Thu, 19 Jan 2023 18:27:56 -0800 (PST)
Received: from maniforge.lan ([2620:10d:c091:480::1:2fc9])
        by smtp.gmail.com with ESMTPSA id x14-20020a05620a258e00b006e07228ed53sm25230695qko.18.2023.01.19.18.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:27:55 -0800 (PST)
Date: Thu, 19 Jan 2023 20:27:59 -0600
From: David Vernet <void@manifault.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@meta.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, tj@kernel.org
Subject: Re: [PATCH bpf-next 1/8] bpf: Enable annotating trusted nested
 pointers
Message-ID: <Y8n8L43j3a7Z4HJe@maniforge.lan>
References: <20230119235833.2948341-2-void@manifault.com>
 <202301200957.At49rpzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301200957.At49rpzu-lkp@intel.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Fri, Jan 20, 2023 at 09:14:25AM +0800, kernel test robot wrote:
> Hi David,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Vernet/bpf-Enable-annotating-trusted-nested-pointers/20230120-080139
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20230119235833.2948341-2-void%40manifault.com
> patch subject: [PATCH bpf-next 1/8] bpf: Enable annotating trusted nested pointers
> config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200957.At49rpzu-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/8f6df14342b1be3516f8e21037edf771df851427
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review David-Vernet/bpf-Enable-annotating-trusted-nested-pointers/20230120-080139
>         git checkout 8f6df14342b1be3516f8e21037edf771df851427
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/bpf/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/bpf/btf.c:533:5: warning: no previous prototype for 'bpf_find_btf_id' [-Wmissing-prototypes]
>      533 | s32 bpf_find_btf_id(const char *name, u32 kind, struct btf **btf_p)

Silly mistake on my part. I removed static while debugging something in
verifier.c and forgot to put it back. I'll put it back in v2.

>          |     ^~~~~~~~~~~~~~~
>    kernel/bpf/btf.c: In function 'btf_seq_show':
>    kernel/bpf/btf.c:6977:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     6977 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
>          |                             ^~~~~~~~
>    kernel/bpf/btf.c: In function 'btf_snprintf_show':
>    kernel/bpf/btf.c:7014:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     7014 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
>          |         ^~~
> 
> 
> vim +/bpf_find_btf_id +533 kernel/bpf/btf.c
> 
>    532	
>  > 533	s32 bpf_find_btf_id(const char *name, u32 kind, struct btf **btf_p)
>    534	{
>    535		struct btf *btf;
>    536		s32 ret;
>    537		int id;
>    538	
>    539		btf = bpf_get_btf_vmlinux();
>    540		if (IS_ERR(btf))
>    541			return PTR_ERR(btf);
>    542		if (!btf)
>    543			return -EINVAL;
>    544	
>    545		ret = btf_find_by_name_kind(btf, name, kind);
>    546		/* ret is never zero, since btf_find_by_name_kind returns
>    547		 * positive btf_id or negative error.
>    548		 */
>    549		if (ret > 0) {
>    550			btf_get(btf);
>    551			*btf_p = btf;
>    552			return ret;
>    553		}
>    554	
>    555		/* If name is not found in vmlinux's BTF then search in module's BTFs */
>    556		spin_lock_bh(&btf_idr_lock);
>    557		idr_for_each_entry(&btf_idr, btf, id) {
>    558			if (!btf_is_module(btf))
>    559				continue;
>    560			/* linear search could be slow hence unlock/lock
>    561			 * the IDR to avoiding holding it for too long
>    562			 */
>    563			btf_get(btf);
>    564			spin_unlock_bh(&btf_idr_lock);
>    565			ret = btf_find_by_name_kind(btf, name, kind);
>    566			if (ret > 0) {
>    567				*btf_p = btf;
>    568				return ret;
>    569			}
>    570			spin_lock_bh(&btf_idr_lock);
>    571			btf_put(btf);
>    572		}
>    573		spin_unlock_bh(&btf_idr_lock);
>    574		return ret;
>    575	}
>    576	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
