Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795364661;
	b=DUmPo9T9VDNbhRgK3mNo49clK1AYgG9GGk0UmXDFCXNuivwdWGzw22ZECaXCoMnOJRx4
	 es0LqyU1CW3FuOpOT10pigFrp6FiXInLgV33ifsoVkA+60EqvwBiImXvi7tKmypM2m9qD
	 QbpCRL3wbY/fE/9+NSDtA89naaB/ibQbSfiGfevcymkTmA5HoKCum/sSDUtEAd4ur/Akq
	 Ht6rycgfBbsW80+qg1BlBBAAjyRtpGMC+XLttleYv5lWSHLzjtdtYEbcid2iO6utpfxN0
	 76Qn1k2ENaTQdf0B/bb2h7Uy6J4/Lryz3z30aKdmmtQ93yMhUyLElnLaPuGnQizboLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
	b=uikO2mWsLqn5+oblsb6kRY+LgFAxyR1unPNe8HzZflmBL4YDf4RhzOVoJVGD84zPyZgA
	 BVWVFzwAlglIhOTUHM8RRvBTHp19eyfHEpLN9J9zMq7Qq7PPC55Rkxr25VDsA+2ESTi02
	 Pu+gfWOVvZFVMWHQkUMbL9v6ylmipMsugTFQNA1XJcTPpLe488aloKF480wteUiTujkwY
	 TFDkQ6ojfTznzCehe1NcaaBHaC6hSK2v2FirHV5StOdbTrWbCBcKSmRIWwEhynWanywr8
	 n5LnOC/fijFA4/CGEonbmsFtHTS2zRzro3CXjYzhOgFQcoNJYzr18Iq44mGDjw2nD9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAmswA5Y;
	arc=fail smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638ED606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAmswA5Y
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ece6c1d1cbso790385e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795364660; cv=none;
        d=google.com; s=arc-20260327;
        b=EaIDB/20t93PQ2wc9E1hYbBOSVeOyYkBG0GyMuVPfpLHW8DjSKJhUp5GvZ40jBFfLd
         1X/ASScgpFzrY/XJTVaenPWyibap7LwYqpnkZqc2A3YbWC/XMth+JnWpFjBLMCQkYY+Z
         Af8zRqHOOANY9P2cg3H0YJOq4neF7obUmlbJe70V2wVdQ5m7XXSZWGC5Hr+jLii+bqwe
         wlavrWhEF4gOAAPT+t4zaHOfzw5QNL8qganA4bEDLuS7TJZnclCPsa43ercGSF6JbKud
         gs0BBTTRYFetVNoZVEwqmy0mto1rORSO4US3L14dsNU/fIMxr5dsb6pXjtpP+83oGYjW
         MBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        fh=e9Ez7HPHurXwTJZOdVIw+F2xfdy063CWr6dV8ldbmCU=;
        b=qkViUFm1LHogcZM9ueE+wRSqzZc0wNjURj3pEh1ecPkgZS9lJVQ3gf5AotHDIQIWmF
         +T/nuRc/nMVMyb0en6nytfv6cOnh9Z9zPg255bzEgHJTAEc47qSeQoyPQZgbCHDRjdRO
         ijjQ2ECcPCtva27d9u4O4hA+V/ktDjrnlehwpmf1ifvECz2S8S+mJXgq82Sj9ITOv8iS
         c/P9P+ooubtGbxilcTtWCXi2kxIe7UMqyJ5HNak7svOviIQqtesNOCuQPvd+mY16iJzn
         y+PyCsdjOzN5kcfqN8R665h9LB+BPd0ybK6kuJ/OCbfDJSYXmdnNjG73jvRuwWAkglYu
         GUvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795364660; x=1795969460; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        b=dAmswA5YdB2L/SWg3dpM4ocAwllJV4S+1gdEaZKUbT03jsSrpmiFUrAMKKyMS6pl6Y
         IWFOG1PHfHUQ+tqtulQIVJHg4ZvXCnDHHgyB6twZ+zRSFYL3mB6IGrckGBTswakbT4np
         sgffaVAgvNdmPrR4ixtjVO5nFCcBleq1mdZh1UxY5Sd5OGYFduGelKxf1Z9tBrhZN1wN
         lqIVQgWa++14wI0ZbE4Ty1PQUdSw5+nbO8ctKUBpsmkvExjcAc+4wsnS7HFrRtfFA7g5
         6nu5fobayt0kMGwbXC7I49qMQVwNkPvAO5reDwbHB4Lyfm7YojbMlUHs43QIj0uq71ZH
         rXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364660; x=1795969460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2HnkONyAz5OvBrfYtDwxSrIOzDjXMJX31dQPz9Vcto=;
        b=DEAfrzw08lMIn8v45mgJpt5Kjjz+cxRcxy9hkN5JwE8NDkdWF2O0L059Y8jQydWjll
         oVsDyBcpquVTl6Rq0yC2mahMC6jpbHyFCVQhoR8TKaOXTE/1jRSkRwytYMDL0Ywi2TsK
         kNfFEel/OYFcpVhCWRXoy4brstRGAqk67CWF1uu7yZf/PoU38RbZhS8acMN644YMCj9N
         3ADIwfKBuQG7X7RR4ZFmXgUYAtlq1XnzEGiNQPnJMPpSTWULXvnp97qAd03WQ7a0mVs7
         EP0RhpaqTVnR5QdpCQK4GTDDpq1d1jLrb2ks2hDKMGqMYnU+DRKeeoYQ0nGpYXdi61n9
         6hiw==
X-Forwarded-Encrypted: i=1; AL+hErHOchm32RupX1w/WujJiAlGCLML/a0pofz1iIlYr1QXPqSb4uPAeF5u9yjeU9Z6LXlIBdK10X0W3Q/Ri1q8@lists.linux.dev
X-Gm-Message-State: APuU4Z/jvJtlkU+M094oZl06Wo6apj42jvlJYlGjkqzAMUvMn3V2fnou
	+EBRQCKey0knkEAxQ71Zz2mQjlgKy+ILLs/l5g0J3bgvfSKhH24ZNLJChSabFyIoj+zS66vdT0w
	zr0okr77SLE8l2M0mzx4HQQ74q6ozM9M=
X-Gm-Gg: AZFdTZdyz3JpqbKeWdDpntkpkYsuURlXFdDpHoGggiIBnFMxsdpt1PLITjSvxBEUVxz
	LSSyBPpxDO418I9H4HLvhsK6GX/XCpybyxu6p+NEed//CJfk1vCuE7FTa2wB61Jyvy5PgMODeF/
	S92VjrZUTkgcnwvfvVNUqPY/n6TpFiPAjaaXS81odAYt9LyD5H4ntsZ8hHR6Wmew4y7T9UZrQhx
	hSv4xLSeGdkGRy/8jqR+KfUdQmwYXO+hRy6X200nwoudYkDXtSlfXd9ZFHe0VwLkIJ+gFFCMtXG
	rOD9m0dFtMxRy0B2kHISnP04ifTFxj1Zgq/aX/VNEjGlPazIHbH9jL22crDmz1PdXuJozNv53d9
	yzvY6XWUWNV1OBqxxbo3hf24O0l/jGOax2wR4tYnYQQ2PoqlgIgtdX3tZCNtWHONQ
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id
 71dfb90a1353d-5ee8af5d5c6mr4139590e0c.19.1795364660204; Sun, 22 Nov 2026
 08:24:20 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122045841.99012-1-fredric.cover.lkernel@gmail.com> <202611221905.fQpuvetd-lkp@intel.com>
In-Reply-To: <202611221905.fQpuvetd-lkp@intel.com>
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
Date: Sun, 22 Nov 2026 08:24:49 -0800
X-Gm-Features: Aa3M54pLCK7XgGyFOtsNWn7B-0IlzQDmNjwu1YO12B2eu424c3ONrYetGFn3o_M
Message-ID: <CAAk_H6H8SZaa6xsKmyViYMwCe+-Z2xaftVjT0zrW_B-PJjvumw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: convert DFS target node name from cache
 charset on mount
To: kernel test robot <lkp@intel.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Tom Talpey <tom@talpey.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paulo and list,
Please ignore these build errors. They are due to the dependency on my othe=
r
patch. If you would like, I can put them both in a series to avoid
errors like this.

Thanks,
Fredric

On Sun, Nov 22, 2026 at 3:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Fredric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on manguebit/cifs-next]
> [also build test ERROR on manguebit/cifs-fixes linus/master v7.4-rc3 next=
-20261120]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Fredric-Cover/smb-=
client-convert-DFS-target-node-name-from-cache-charset-on-mount/20261122-04=
5840
> base:   https://git.manguebit.org/linux.git cifs-next
> patch link:    https://lore.kernel.org/r/20261122045841.99012-1-fredric.c=
over.lkernel%40gmail.com
> patch subject: [PATCH] smb: client: convert DFS target node name from cac=
he charset on mount
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261122=
/202611221905.fQpuvetd-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261122/202611221905.fQpuvetd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611221905.fQpuvetd-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/smb/client/dfs.c: In function 'dfs_parse_target_referral':
> >> fs/smb/client/dfs.c:44:21: error: implicit declaration of function 'df=
s_cache_local_path'; did you mean 'dfs_cache_canonical_path'? [-Wimplicit-f=
unction-declaration]
>       44 |         node_name =3D dfs_cache_local_path(ref->node_name, ctx=
->local_nls);
>          |                     ^~~~~~~~~~~~~~~~~~~~
>          |                     dfs_cache_canonical_path
> >> fs/smb/client/dfs.c:44:19: error: assignment to 'char *' from 'int' ma=
kes pointer from integer without a cast [-Wint-conversion]
>       44 |         node_name =3D dfs_cache_local_path(ref->node_name, ctx=
->local_nls);
>          |                   ^
>
>
> vim +44 fs/smb/client/dfs.c
>
>     13
>     14  /**
>     15   * dfs_parse_target_referral - set fs context for dfs target refe=
rral
>     16   *
>     17   * @full_path: full path in UNC format.
>     18   * @ref: dfs referral pointer.
>     19   * @ctx: smb3 fs context pointer.
>     20   *
>     21   * Return zero if dfs referral was parsed correctly, otherwise no=
n-zero.
>     22   */
>     23  int dfs_parse_target_referral(const char *full_path, const struct=
 dfs_info3_param *ref,
>     24                                struct smb3_fs_context *ctx)
>     25  {
>     26          int rc;
>     27          const char *prepath =3D NULL;
>     28          char *node_name =3D NULL;
>     29          char *path;
>     30
>     31          if (!full_path || !*full_path || !ref || !ctx)
>     32                  return -EINVAL;
>     33
>     34          if (WARN_ON_ONCE(!ref->node_name || ref->path_consumed < =
0))
>     35                  return -EINVAL;
>     36
>     37          if ((size_t)ref->path_consumed < strlen(full_path)) {
>     38                  prepath =3D full_path + ref->path_consumed;
>     39                  /* skip initial delimiter */
>     40                  if (*prepath =3D=3D '/' || *prepath =3D=3D '\\')
>     41                          prepath++;
>     42          }
>     43
>   > 44          node_name =3D dfs_cache_local_path(ref->node_name, ctx->l=
ocal_nls);
>     45          if (IS_ERR(node_name))
>     46                  return PTR_ERR(node_name);
>     47
>     48          path =3D cifs_build_devname(node_name, prepath);
>     49          kfree(node_name);
>     50          if (IS_ERR(path))
>     51                  return PTR_ERR(path);
>     52
>     53          rc =3D smb3_parse_devname(path, ctx);
>     54          if (rc)
>     55                  goto out;
>     56
>     57          rc =3D dns_resolve_unc(DFS_DOM(ctx), path,
>     58                               (struct sockaddr *)&ctx->dstaddr);
>     59  out:
>     60          kfree(path);
>     61          return rc;
>     62  }
>     63
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
