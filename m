Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281D1879
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 02:30:59 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-65641c171cbso33267716d6.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 19:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695609058; x=1696213858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23lnBCKLz4e+Ey/2/Ngn+gsUPF5zkjq8+fPgmejrkOs=;
        b=k3nxkznPSOuGSiVE2WkB/pw+6puZUcAWYcXq3cZJJtjZBxer9vE2McQITqn7n5RTTL
         2MgqwgETmIT3L4GF+pdB2jmhCy930/4Cr766cW84iARn5uyoGd0NtFG3nB/4jWrltQkg
         3EVbueMivO6TM+gYQrXOhyRnxU+jU4CvR3ETpwoww/utJpnZnglrvxrlmqtgpkzadw9L
         /GPdlD1J0WqbbbKIOO4mwqiKDEHuBZ7Pbkuw+AfD90w8wbNkqTO7Ep8XzBBIPi99Zk+w
         IttWTnwNUi93fsr6iXhSsn/IecXjNaznZa8M1yicxHHddr9HCTjwnA+C37lG8P1Opi2h
         cc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695609058; x=1696213858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23lnBCKLz4e+Ey/2/Ngn+gsUPF5zkjq8+fPgmejrkOs=;
        b=WeT9KaYbyHljoKCjR3glmL4sONn7PwIZz76wIsBTc2IISitGR3uoFTgu4r2Mx45Ywe
         muN+ZOzrvTqGzQm8NcNqhHAXJqBg+oNaVH7vJP2bCPzXzdqM106RgMdcDtF3t5WgACqn
         JHH3Dt7hXymvOl910jJ7JrTy9jqNRoGb8tD3EvRApqg5/DFzDLtnc3WeHEX4AMjkdD/1
         alqVU7bmfLazJ/hfxUJgb9MpcCcp1ESmsxUEbst77+zhaRkbucv20I8xeIjnqJcmTbGi
         Ldz8KqBWVSzcfntdymTfkktVTv2RGEoZncNe30UXSmLeOA+wk7s3O7lVQhIwgIoJGTTH
         SBFg==
X-Gm-Message-State: AOJu0YzrNqGkEEaxFkY2sZC8b++00KZXObndDRKAKZRRJaItUeMeempW
	NmUfgkXvD//u77cW9zsTHEEhtzYHujALlkj+rss=
X-Google-Smtp-Source: AGHT+IES8DNr7SfVT90QfuwNXYKYYCMim2NE0X2pWbjIVZR/ofLYcgXH9ckSJLfqZCAMf2bCo3NR1sereDh61YPmnk8=
X-Received: by 2002:a0c:dc90:0:b0:658:2220:d833 with SMTP id
 n16-20020a0cdc90000000b006582220d833mr5684644qvk.0.1695609058264; Sun, 24 Sep
 2023 19:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922112846.4265-5-laoar.shao@gmail.com> <202309241550.JnHcYTZh-lkp@intel.com>
In-Reply-To: <202309241550.JnHcYTZh-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 25 Sep 2023 10:30:22 +0800
Message-ID: <CALOAHbBXMyTn=QGN_SRRSd_xA2Vui6C=2aUVgBLnZ9zENrOu_g@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup controller
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 3:47=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Fi=
x-missed-rcu-read-lock-in-bpf_task_under_cgroup/20230922-193148
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230922112846.4265-5-laoar.shao=
%40gmail.com
> patch subject: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for c=
group controller
> config: i386-randconfig-013-20230924 (https://download.01.org/0day-ci/arc=
hive/20230924/202309241550.JnHcYTZh-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230924/202309241550.JnHcYTZh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309241550.JnHcYTZh-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/helpers.c:1892:19: warning: no previous declaration for 'bp=
f_obj_new_impl' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__=
ign)
>                       ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1906:19: warning: no previous declaration for 'bp=
f_percpu_obj_new_impl' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_percpu_obj_new_impl(u64 local_type_id__k, void =
*meta__ign)
>                       ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1934:18: warning: no previous declaration for 'bp=
f_obj_drop_impl' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
>                      ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1942:18: warning: no previous declaration for 'bp=
f_percpu_obj_drop_impl' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_percpu_obj_drop_impl(void *p__alloc, void *meta_=
_ign)
>                      ^~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1948:19: warning: no previous declaration for 'bp=
f_refcount_acquire_impl' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_refcount_acquire_impl(void *p__refcounted_kptr,=
 void *meta__ign)
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:1993:17: warning: no previous declaration for 'bp=
f_list_push_front_impl' [-Wmissing-declarations]
>     __bpf_kfunc int bpf_list_push_front_impl(struct bpf_list_head *head,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2003:17: warning: no previous declaration for 'bp=
f_list_push_back_impl' [-Wmissing-declarations]
>     __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
>                     ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2036:35: warning: no previous declaration for 'bp=
f_list_pop_front' [-Wmissing-declarations]
>     __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_=
head *head)
>                                       ^~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2041:35: warning: no previous declaration for 'bp=
f_list_pop_back' [-Wmissing-declarations]
>     __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_h=
ead *head)
>                                       ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2046:33: warning: no previous declaration for 'bp=
f_rbtree_remove' [-Wmissing-declarations]
>     __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root =
*root,
>                                     ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2102:17: warning: no previous declaration for 'bp=
f_rbtree_add_impl' [-Wmissing-declarations]
>     __bpf_kfunc int bpf_rbtree_add_impl(struct bpf_rb_root *root, struct =
bpf_rb_node *node,
>                     ^~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2112:33: warning: no previous declaration for 'bp=
f_rbtree_first' [-Wmissing-declarations]
>     __bpf_kfunc struct bpf_rb_node *bpf_rbtree_first(struct bpf_rb_root *=
root)
>                                     ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2125:33: warning: no previous declaration for 'bp=
f_task_acquire' [-Wmissing-declarations]
>     __bpf_kfunc struct task_struct *bpf_task_acquire(struct task_struct *=
p)
>                                     ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2136:18: warning: no previous declaration for 'bp=
f_task_release' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_task_release(struct task_struct *p)
>                      ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2148:28: warning: no previous declaration for 'bp=
f_cgroup_acquire' [-Wmissing-declarations]
>     __bpf_kfunc struct cgroup *bpf_cgroup_acquire(struct cgroup *cgrp)
>                                ^~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2160:18: warning: no previous declaration for 'bp=
f_cgroup_release' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_cgroup_release(struct cgroup *cgrp)
>                      ^~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2172:28: warning: no previous declaration for 'bp=
f_cgroup_ancestor' [-Wmissing-declarations]
>     __bpf_kfunc struct cgroup *bpf_cgroup_ancestor(struct cgroup *cgrp, i=
nt level)
>                                ^~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2192:28: warning: no previous declaration for 'bp=
f_cgroup_from_id' [-Wmissing-declarations]
>     __bpf_kfunc struct cgroup *bpf_cgroup_from_id(u64 cgid)
>                                ^~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2212:18: warning: no previous declaration for 'bp=
f_task_under_cgroup' [-Wmissing-declarations]
>     __bpf_kfunc long bpf_task_under_cgroup(struct task_struct *task,
>                      ^~~~~~~~~~~~~~~~~~~~~
> >> kernel/bpf/helpers.c:2229:17: warning: no previous declaration for 'bp=
f_cgroup_id_from_task_within_controller' [-Wmissing-declarations]
>     __bpf_kfunc u64 bpf_cgroup_id_from_task_within_controller(struct task=
_struct *task, int ssid)
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> kernel/bpf/helpers.c:2252:17: warning: no previous declaration for 'bp=
f_cgroup_ancestor_id_from_task_within_controller' [-Wmissing-declarations]
>     __bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controller(st=
ruct task_struct *task,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> kernel/bpf/helpers.c:2279:28: warning: no previous declaration for 'bp=
f_cgroup_acquire_from_id_within_controller' [-Wmissing-declarations]
>     __bpf_kfunc struct cgroup *bpf_cgroup_acquire_from_id_within_controll=
er(u64 cgid, int ssid)
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>    kernel/bpf/helpers.c:2297:33: warning: no previous declaration for 'bp=
f_task_from_pid' [-Wmissing-declarations]
>     __bpf_kfunc struct task_struct *bpf_task_from_pid(s32 pid)
>                                     ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2338:19: warning: no previous declaration for 'bp=
f_dynptr_slice' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr,=
 u32 offset,
>                       ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2422:19: warning: no previous declaration for 'bp=
f_dynptr_slice_rdwr' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern =
*ptr, u32 offset,
>                       ^~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2453:17: warning: no previous declaration for 'bp=
f_dynptr_adjust' [-Wmissing-declarations]
>     __bpf_kfunc int bpf_dynptr_adjust(struct bpf_dynptr_kern *ptr, u32 st=
art, u32 end)
>                     ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2471:18: warning: no previous declaration for 'bp=
f_dynptr_is_null' [-Wmissing-declarations]
>     __bpf_kfunc bool bpf_dynptr_is_null(struct bpf_dynptr_kern *ptr)
>                      ^~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2476:18: warning: no previous declaration for 'bp=
f_dynptr_is_rdonly' [-Wmissing-declarations]
>     __bpf_kfunc bool bpf_dynptr_is_rdonly(struct bpf_dynptr_kern *ptr)
>                      ^~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2484:19: warning: no previous declaration for 'bp=
f_dynptr_size' [-Wmissing-declarations]
>     __bpf_kfunc __u32 bpf_dynptr_size(const struct bpf_dynptr_kern *ptr)
>                       ^~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2492:17: warning: no previous declaration for 'bp=
f_dynptr_clone' [-Wmissing-declarations]
>     __bpf_kfunc int bpf_dynptr_clone(struct bpf_dynptr_kern *ptr,
>                     ^~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2505:19: warning: no previous declaration for 'bp=
f_cast_to_kern_ctx' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_cast_to_kern_ctx(void *obj)
>                       ^~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2510:19: warning: no previous declaration for 'bp=
f_rdonly_cast' [-Wmissing-declarations]
>     __bpf_kfunc void *bpf_rdonly_cast(void *obj__ign, u32 btf_id__k)
>                       ^~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2515:18: warning: no previous declaration for 'bp=
f_rcu_read_lock' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_rcu_read_lock(void)
>                      ^~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2520:18: warning: no previous declaration for 'bp=
f_rcu_read_unlock' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_rcu_read_unlock(void)
>                      ^~~~~~~~~~~~~~~~~~~
>    kernel/bpf/helpers.c:2549:18: warning: no previous declaration for 'bp=
f_throw' [-Wmissing-declarations]
>     __bpf_kfunc void bpf_throw(u64 cookie)
>                      ^~~~~~~~~
>
>
> vim +/bpf_cgroup_id_from_task_within_controller +2229 kernel/bpf/helpers.=
c
>
>   2222
>   2223  /**
>   2224   * bpf_cgroup_id_from_task_within_controller - To get the associa=
ted cgroup_id from
>   2225   * a task within a specific cgroup controller.
>   2226   * @task: The target task
>   2227   * @ssid: The id of cgroup controller, e.g. cpu_cgrp_id, memory_c=
grp_id and etc.
>   2228   */
> > 2229  __bpf_kfunc u64 bpf_cgroup_id_from_task_within_controller(struct =
task_struct *task, int ssid)
>   2230  {
>   2231          struct cgroup *cgroup;
>   2232          int id =3D 0;
>   2233
>   2234          rcu_read_lock();
>   2235          cgroup =3D task_cgroup(task, ssid);
>   2236          if (!cgroup)
>   2237                  goto out;
>   2238          id =3D cgroup_id(cgroup);
>   2239
>   2240  out:
>   2241          rcu_read_unlock();
>   2242          return id;
>   2243  }
>   2244
>   2245  /**
>   2246   * bpf_cgroup_id_from_task_within_controller - To get the associa=
ted cgroup_id from
>   2247   * a task within a specific cgroup controller.
>   2248   * @task: The target task
>   2249   * @ssid: The id of cgroup subsystem, e.g. cpu_cgrp_id, memory_cg=
rp_id and etc.
>   2250   * @level: The level of ancestor to look up
>   2251   */
> > 2252  __bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controlle=
r(struct task_struct *task,
>   2253                                                                   =
  int ssid, int level)
>   2254  {
>   2255          struct cgroup *cgrp, *ancestor;
>   2256          int id =3D 0;
>   2257
>   2258          rcu_read_lock();
>   2259          cgrp =3D task_cgroup(task, ssid);
>   2260          if (!cgrp)
>   2261                  goto out;
>   2262          ancestor =3D cgroup_ancestor(cgrp, level);
>   2263          if (ancestor)
>   2264                  id =3D cgroup_id(ancestor);
>   2265
>   2266  out:
>   2267          rcu_read_unlock();
>   2268          return id;
>   2269  }
>   2270
>   2271  /**
>   2272   * bpf_cgroup_acquire_from_id_within_controller - To acquire the =
cgroup from a
>   2273   * cgroup id within specific cgroup controller. A cgroup acquired=
 by this kfunc
>   2274   * which is not stored in a map as a kptr, must be released by ca=
lling
>   2275   * bpf_cgroup_release().
>   2276   * @cgid: cgroup id
>   2277   * @ssid: The id of a cgroup controller, e.g. cpu_cgrp_id, memory=
_cgrp_id and etc.
>   2278   */
> > 2279  __bpf_kfunc struct cgroup *bpf_cgroup_acquire_from_id_within_cont=
roller(u64 cgid, int ssid)
>   2280  {
>   2281          struct cgroup *cgrp;
>   2282
>   2283          cgrp =3D cgroup_get_from_id_within_subsys(cgid, ssid);
>   2284          if (IS_ERR(cgrp))
>   2285                  return NULL;
>   2286          return cgrp;
>   2287  }
>   2288
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for your report.
But these reports seems wrong, because there's an annotation to avoid
"missing-prototypes", as follows:

__diag_push();
__diag_ignore_all("-Wmissing-prototypes",
                  "Global functions as their definitions will be in
vmlinux BTF");



--=20
Regards
Yafang
