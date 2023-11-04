Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824C1C3D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 03:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVukaz70"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so2511472a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Nov 2023 20:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699068013; x=1699672813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOW5NXugmBea90l4dKOafO6jV5KmHbw2vGXiSLGBI9E=;
        b=UVukaz708wi20no3DGnLm2Yc37JBwFCiV08ze5XPkAuvXXo7wNgi+2LmHMA/ugUd3k
         2pojOSxqzyXZe3Cr00Wye+js/uVzr7E2ZkKPfQObkZjQec6+WkFM528+DnVwNUwXumm2
         tget8AibbsCT5NsCrpvwbYlZ1GJ1aN+sXJZNbRo37vAd//4i1WOEzzwldBDAH8iBHJi5
         Zetxlx7STqyeLEnWIF4GmSy1W+rinxJqK1LWS0Zi8JytKTNJCde2pZrKbAIvkQyuJ/xd
         KJ3PJJzG4YdgHshBn9Fne+efX18TMt+7VB2v7VuwQ+D5DsUnDBc42183/Eyf69xm91F8
         ZTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699068013; x=1699672813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOW5NXugmBea90l4dKOafO6jV5KmHbw2vGXiSLGBI9E=;
        b=sMsQ7TqBPcKbbWoEMU3FQjHlBexNxGO8MdMXMBN4cmr82eZ1nA6TfiaN9paCc0DlYO
         bzNgUXFrbcsbB9CZU3+yZ1NThy84OW9qBgZ+3LFC5HFhb7Rbaw84uFs13NdTF/bveHnH
         yuepQyXU7RBLjjpb4PN9MzEZEb1e5KAQ1Ws4LMSKUO0Zt39oFH95FyIa7evEvmoiLq/Z
         kXAHvvq310ysjkramL8dxNkMWHrQIlAI1k6RYbMlB/iZHvPIdif8iXceQ61jJqqQ+sb9
         btGGSlizSLantz4+AQSrm1KjkSTsdO7Gq/1I93OhTJvrc1FI9jJfECM56493jzi2lgD8
         drYA==
X-Gm-Message-State: AOJu0Yy8vpO+5ykrrZae2X4hxqi/+s9dF9bigWN+IElsIdb83Xxj+Wb5
	zxgDKnzSG+N2/B5coqRqgVazX0L+Kit+gtoDOqA=
X-Google-Smtp-Source: AGHT+IH8xLd1pq+w86VCm/cKNI64XRbSamj+/kboZu69o9awtVYVZLgfXtThmlzUdhhsNjVZgvHogC1tJieS0oaaRIE=
X-Received: by 2002:a17:907:9617:b0:9d3:f436:6826 with SMTP id
 gb23-20020a170907961700b009d3f4366826mr7837195ejc.38.1699068013082; Fri, 03
 Nov 2023 20:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103190523.6353-12-andrii@kernel.org> <202311040829.XrnpSV8z-lkp@intel.com>
In-Reply-To: <202311040829.XrnpSV8z-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Nov 2023 20:20:01 -0700
Message-ID: <CAEf4Bza8V6nGgR6Nb5sEvWUMdAhKi63qCoiP4RJV85sLO7ia6Q@mail.gmail.com>
Subject: Re: [PATCH v9 bpf-next 11/17] bpf,lsm: add BPF token LSM hooks
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	paul@paul-moore.com, brauner@kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	keescook@chromium.org, kernel-team@meta.com, sargun@sargun.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 5:38=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Andrii,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-align-CAP_NET_ADMIN-checks-with-bpf_capable-approach/20231104-031714
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231103190523.6353-12-andrii%40=
kernel.org
> patch subject: [PATCH v9 bpf-next 11/17] bpf,lsm: add BPF token LSM hooks
> config: m68k-defconfig (https://download.01.org/0day-ci/archive/20231104/=
202311040829.XrnpSV8z-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231104/202311040829.XrnpSV8z-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311040829.XrnpSV8z-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/net/scm.h:8,
>                     from include/linux/netlink.h:9,
>                     from include/uapi/linux/neighbour.h:6,
>                     from include/linux/netdevice.h:45,
>                     from include/net/sock.h:46,
>                     from include/linux/tcp.h:19,
>                     from include/linux/ipv6.h:95,
>                     from include/net/ipv6.h:12,
>                     from include/linux/sunrpc/addr.h:14,
>                     from fs/nfsd/nfsd.h:22,
>                     from fs/nfsd/state.h:42,
>                     from fs/nfsd/xdr4.h:40,
>                     from fs/nfsd/trace.h:17,
>                     from fs/nfsd/trace.c:4:
> >> include/linux/security.h:2084:92: error: parameter 2 ('cmd') has incom=
plete type
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                                                               =
                ~~~~~~~~~~~~~^~~
> >> include/linux/security.h:2084:19: error: function declaration isn't a =
prototype [-Werror=3Dstrict-prototypes]
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Ok, so apparently enum forward declaration doesn't work with static
inline functions.

Would it be ok to just #include <linux/bpf.h> in this file?

$ git diff
diff --git a/include/linux/security.h b/include/linux/security.h
index 1d6edbf45d1c..cfe6176824c2 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -32,6 +32,7 @@
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/sockptr.h>
+#include <linux/bpf.h>

 struct linux_binprm;
 struct cred;
@@ -60,7 +61,6 @@ struct fs_parameter;
 enum fs_value_type;
 struct watch;
 struct watch_notification;
-enum bpf_cmd;

 /* Default (no) options for the capable function */
 #define CAP_OPT_NONE 0x0


If not, then I guess another alternative would be to pass `int cmd`
instead of `enum bpf_cmd cmd`, but that doesn't seems like the best
solution, tbh.

Paul, any preferences?

> --
>    In file included from include/net/scm.h:8,
>                     from include/linux/netlink.h:9,
>                     from include/uapi/linux/neighbour.h:6,
>                     from include/linux/netdevice.h:45,
>                     from include/net/sock.h:46,
>                     from include/linux/tcp.h:19,
>                     from include/linux/ipv6.h:95,
>                     from include/net/ipv6.h:12,
>                     from include/linux/sunrpc/addr.h:14,
>                     from fs/nfsd/nfsd.h:22,
>                     from fs/nfsd/export.c:21:
> >> include/linux/security.h:2084:92: error: parameter 2 ('cmd') has incom=
plete type
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                                                               =
                ~~~~~~~~~~~~~^~~
> >> include/linux/security.h:2084:19: error: function declaration isn't a =
prototype [-Werror=3Dstrict-prototypes]
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/nfsd/export.c: In function 'exp_rootfh':
>    fs/nfsd/export.c:1017:34: warning: variable 'inode' set but not used [=
-Wunused-but-set-variable]
>     1017 |         struct inode            *inode;
>          |                                  ^~~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from include/net/scm.h:8,
>                     from include/linux/netlink.h:9,
>                     from include/uapi/linux/neighbour.h:6,
>                     from include/linux/netdevice.h:45,
>                     from include/net/sock.h:46,
>                     from include/linux/tcp.h:19,
>                     from include/linux/ipv6.h:95,
>                     from include/net/ipv6.h:12,
>                     from include/linux/sunrpc/addr.h:14,
>                     from fs/nfsd/nfsd.h:22,
>                     from fs/nfsd/state.h:42,
>                     from fs/nfsd/xdr4.h:40,
>                     from fs/nfsd/trace.h:17,
>                     from fs/nfsd/trace.c:4:
> >> include/linux/security.h:2084:92: error: parameter 2 ('cmd') has incom=
plete type
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                                                               =
                ~~~~~~~~~~~~~^~~
> >> include/linux/security.h:2084:19: error: function declaration isn't a =
prototype [-Werror=3Dstrict-prototypes]
>     2084 | static inline int security_bpf_token_allow_cmd(const struct bp=
f_token *token, enum bpf_cmd cmd)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from fs/nfsd/trace.h:1958:
>    include/trace/define_trace.h:95:42: fatal error: ./trace.h: No such fi=
le or directory
>       95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>          |                                          ^
>    cc1: some warnings being treated as errors
>    compilation terminated.
>
>
> vim +2084 include/linux/security.h
>
>   2083
> > 2084  static inline int security_bpf_token_allow_cmd(const struct bpf_t=
oken *token, enum bpf_cmd cmd)
>   2085  {
>   2086          return 0;
>   2087  }
>   2088
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
