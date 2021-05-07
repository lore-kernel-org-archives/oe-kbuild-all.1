Content-Type: multipart/mixed; boundary="===============1332353298182042945=="
MIME-Version: 1.0
From: Bernard <bernard@vivo.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] drm/i915: Use might_alloc()
Date: Fri, 07 May 2021 07:35:44 +0000
Message-ID: <AL2APQB8DsrABpe7MxMMyqq4.3.1620372906272.Hmail.bernard@vivo.com>
In-Reply-To: <YIxBfNnwA/7nEenj@phenom.ffwll.local>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1332353298182042945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


From: Daniel Vetter <daniel@ffwll.ch>
Date: 2021-05-01 01:42:20
To:  kernel test robot <lkp@intel.com>
Cc:  Bernard Zhao <bernard@vivo.com>,Jani Nikula <jani.nikula@linux.int=
el.com>,Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,Rodrigo Vivi <r=
odrigo.vivi@intel.com>,David Airlie <airlied@linux.ie>,Daniel Vetter <d=
aniel@ffwll.ch>,intel-gfx(a)lists.freedesktop.org,dri-devel(a)lists.freed=
esktop.org,linux-kernel(a)vger.kernel.org,kbuild-all(a)lists.01.org
Subject: Re: [PATCH] drm/i915: Use might_alloc()>On Fri, Apr 30, 2021 at 12=
:31:27AM +0800, kernel test robot wrote:
>> Hi Bernard,
>> =

>> Thank you for the patch! Yet something to improve:
>> =

>> [auto build test ERROR on drm-intel/for-linux-next]
>> [also build test ERROR on v5.12 next-20210429]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>> =

>> url:    https://github.com/0day-ci/linux/commits/Bernard-Zhao/drm-i915-U=
se-might_alloc/20210429-104516
>> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
>> config: x86_64-rhel-8.3-kselftests (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         # https://github.com/0day-ci/linux/commit/9fbd0c1741ce06241105d7=
53ff3432ab55f3e94a
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review Bernard-Zhao/drm-i915-Use-might=
_alloc/20210429-104516
>>         git checkout 9fbd0c1741ce06241105d753ff3432ab55f3e94a
>>         # save the attached .config to linux build tree
>>         make W=3D1 W=3D1 ARCH=3Dx86_64 =

>> =

>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> =

>> All errors (new ones prefixed by >>):
>> =

>>    drivers/gpu/drm/i915/i915_sw_fence.c: In function '__i915_sw_fence_aw=
ait_sw_fence':
>> >> drivers/gpu/drm/i915/i915_sw_fence.c:344:2: error: implicit declarati=
on of function 'might_alloc'; did you mean 'might_lock'? [-Werror=3Dimplici=
t-function-declaration]
>>      344 |  might_alloc(gfp);
>>          |  ^~~~~~~~~~~
>>          |  might_lock
>>    cc1: some warnings being treated as errors
>
>I think you're missing an include or something. The other patch you've
>done seems good, I queued that up in drm-intel-gt-next for 5.14.
>
>Thanks, Daniel

Hi
It looks like I did not include the header file <linux/sched/mm.h>
I will resubmit one patch, thanks!
BR//Bernard

>> =

>> =

>> vim +344 drivers/gpu/drm/i915/i915_sw_fence.c
>> =

>>    335	=

>>    336	static int __i915_sw_fence_await_sw_fence(struct i915_sw_fence *f=
ence,
>>    337						  struct i915_sw_fence *signaler,
>>    338						  wait_queue_entry_t *wq, gfp_t gfp)
>>    339	{
>>    340		unsigned int pending;
>>    341		unsigned long flags;
>>    342	=

>>    343		debug_fence_assert(fence);
>>  > 344		might_alloc(gfp);
>>    345	=

>>    346		if (i915_sw_fence_done(signaler)) {
>>    347			i915_sw_fence_set_error_once(fence, signaler->error);
>>    348			return 0;
>>    349		}
>>    350	=

>>    351		debug_fence_assert(signaler);
>>    352	=

>>    353		/* The dependency graph must be acyclic. */
>>    354		if (unlikely(i915_sw_fence_check_if_after(fence, signaler)))
>>    355			return -EINVAL;
>>    356	=

>>    357		pending =3D I915_SW_FENCE_FLAG_FENCE;
>>    358		if (!wq) {
>>    359			wq =3D kmalloc(sizeof(*wq), gfp);
>>    360			if (!wq) {
>>    361				if (!gfpflags_allow_blocking(gfp))
>>    362					return -ENOMEM;
>>    363	=

>>    364				i915_sw_fence_wait(signaler);
>>    365				i915_sw_fence_set_error_once(fence, signaler->error);
>>    366				return 0;
>>    367			}
>>    368	=

>>    369			pending |=3D I915_SW_FENCE_FLAG_ALLOC;
>>    370		}
>>    371	=

>>    372		INIT_LIST_HEAD(&wq->entry);
>>    373		wq->flags =3D pending;
>>    374		wq->func =3D i915_sw_fence_wake;
>>    375		wq->private =3D fence;
>>    376	=

>>    377		i915_sw_fence_await(fence);
>>    378	=

>>    379		spin_lock_irqsave(&signaler->wait.lock, flags);
>>    380		if (likely(!i915_sw_fence_done(signaler))) {
>>    381			__add_wait_queue_entry_tail(&signaler->wait, wq);
>>    382			pending =3D 1;
>>    383		} else {
>>    384			i915_sw_fence_wake(wq, 0, signaler->error, NULL);
>>    385			pending =3D 0;
>>    386		}
>>    387		spin_unlock_irqrestore(&signaler->wait.lock, flags);
>>    388	=

>>    389		return pending;
>>    390	}
>>    391	=

>> =

>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>
>
>-- =

>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch



--===============1332353298182042945==--

