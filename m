Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698C017C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 00:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D46DC433EF;
	Sun,  4 Jun 2023 00:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685838912;
	bh=cpTSu8S3KEtLEek6nLa6jm/rrRvfkZXDxoDKRPh5TE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q0ez31PO5NmCR/BZZ65wchAaKrVOldF5bSiKcTuUxmFBzl2Zh/syauycEJAMa66cC
	 L6VvCVmWKdm54a4aA1OfgvRJAzKp8FaZqyUZtZCgO2kDmqakhCOcQnVXa/pwetMI0X
	 wCMsPTVoA35BRvItjNfye0jjX1ucP6OsBIN+qEhPrIysgnG5n8rhekCSM7hYQwW3gP
	 XVxQYNRonw7UtJaf4h88jDzA+ZUMx8mgnsbGQX2GU4b4g01N1p7y2Ooa+uTCc1pSYw
	 ZbwgDjHRsKKjFnrlnLq6byfHi36/t1P+/rUbMHaIaWoxURQyDWI56dY/pdLlKQlVyt
	 7DadT7Al/yd1Q==
Date: Sun, 4 Jun 2023 09:35:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [mhiramat:topic/fprobe-event-ext 8/12]
 kernel/trace/trace_probe.c:1221:24: sparse: sparse: Using plain integer as
 NULL pointer
Message-Id: <20230604093510.0a50503387b3d2f3eef061ae@kernel.org>
In-Reply-To: <202306030940.Cej2JoUx-lkp@intel.com>
References: <202306030940.Cej2JoUx-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 3 Jun 2023 09:26:55 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
> head:   843ca9b373cdec3c78df6c1c1dff66e7524adc13
> commit: 945438c254bb2bb4e102f1d5cfac93133ca821f1 [8/12] tracing/probes: Add $arg* meta argument for all function args
> config: riscv-randconfig-s051-20230531 (https://download.01.org/0day-ci/archive/20230603/202306030940.Cej2JoUx-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.3.0
> reproduce:
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=945438c254bb2bb4e102f1d5cfac93133ca821f1
>         git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
>         git fetch --no-tags mhiramat topic/fprobe-event-ext
>         git checkout 945438c254bb2bb4e102f1d5cfac93133ca821f1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash kernel/trace/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306030940.Cej2JoUx-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    WARNING: invalid argument to '-march': '_zihintpause'
> >> kernel/trace/trace_probe.c:1221:24: sparse: sparse: Using plain integer as NULL pointer

Good catch! Thanks!

> 
> vim +1221 kernel/trace/trace_probe.c
> 
>   1193	
>   1194	/* Return new_argv which must be freed after use */
>   1195	const char **traceprobe_expand_meta_args(int argc, const char *argv[],
>   1196						 int *new_argc, char *buf, int bufsize,
>   1197						 struct traceprobe_parse_context *ctx)
>   1198	{
>   1199		const struct btf_param *params = NULL;
>   1200		int i, j, n, used, ret, args_idx = -1;
>   1201		const char **new_argv = NULL;
>   1202		int nr_params;
>   1203	
>   1204		ret = argv_has_var_arg(argc, argv, &args_idx, ctx);
>   1205		if (ret < 0)
>   1206			return ERR_PTR(ret);
>   1207	
>   1208		if (!ret) {
>   1209			*new_argc = argc;
>   1210			return NULL;
>   1211		}
>   1212	
>   1213		params = find_btf_func_param(ctx->funcname, &nr_params,
>   1214					     ctx->flags & TPARG_FL_TPOINT);
>   1215		if (IS_ERR(params)) {
>   1216			if (args_idx != -1) {
>   1217				/* $arg* requires BTF info */
>   1218				trace_probe_log_err(0, NOSUP_BTFARG);
>   1219				return (const char **)params;
>   1220			}
> > 1221			return 0;
>   1222		}
>   1223		ctx->params = params;
>   1224		ctx->nr_params = nr_params;
>   1225	
>   1226		if (args_idx >= 0)
>   1227			*new_argc = argc + ctx->nr_params - 1;
>   1228		else
>   1229			*new_argc = argc;
>   1230	
>   1231		new_argv = kcalloc(*new_argc, sizeof(char *), GFP_KERNEL);
>   1232		if (!new_argv)
>   1233			return ERR_PTR(-ENOMEM);
>   1234	
>   1235		used = 0;
>   1236		for (i = 0, j = 0; i < argc; i++) {
>   1237			trace_probe_log_set_index(i + 2);
>   1238			if (i == args_idx) {
>   1239				for (n = 0; n < nr_params; n++) {
>   1240					ret = sprint_nth_btf_arg(n, "", buf + used,
>   1241								 bufsize - used, ctx);
>   1242					if (ret < 0)
>   1243						goto error;
>   1244	
>   1245					new_argv[j++] = buf + used;
>   1246					used += ret + 1;
>   1247				}
>   1248				continue;
>   1249			}
>   1250	
>   1251			if (str_has_prefix(argv[i], "$arg")) {
>   1252				char *type = NULL;
>   1253	
>   1254				n = simple_strtoul(argv[i] + 4, &type, 10);
>   1255				if (type && !(*type == ':' || *type == '\0')) {
>   1256					trace_probe_log_err(0, BAD_VAR);
>   1257					ret = -ENOENT;
>   1258					goto error;
>   1259				}
>   1260				/* Note: $argN starts from $arg1 */
>   1261				ret = sprint_nth_btf_arg(n - 1, type, buf + used,
>   1262							 bufsize - used, ctx);
>   1263				if (ret < 0)
>   1264					goto error;
>   1265				new_argv[j++] = buf + used;
>   1266				used += ret + 1;
>   1267			} else
>   1268				new_argv[j++] = argv[i];
>   1269		}
>   1270	
>   1271		return new_argv;
>   1272	
>   1273	error:
>   1274		kfree(new_argv);
>   1275		return ERR_PTR(ret);
>   1276	}
>   1277	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
