Content-Type: multipart/mixed; boundary="===============2476525038404813643=="
MIME-Version: 1.0
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
Date: Mon, 04 Jan 2021 12:53:57 +0530
Message-ID: <c6964a2e396f2c5376870ab57ec4744d@codeaurora.org>
In-Reply-To: <CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2476525038404813643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On 2021-01-03 20:54, Arnd Bergmann wrote:
> On Sun, Jan 3, 2021 at 4:09 PM kernel test robot <lkp@intel.com> wrote:
>> =

>> Hi Arnd,
>> =

>> I love your patch! Yet something to improve:
>> =

>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.11-rc1 next-20201223]
>> [If your patch is applied to the wrong git tree, kindly drop us a =

>> note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>> =

>> url:    =

>> https://github.com/0day-ci/linux/commits/Arnd-Bergmann/drm-msm-a6xx-add-=
CONFIG_QCOM_LLCC-dependency/20210103-220704
>> base:   =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =

>> 3516bd729358a2a9b090c1905bd2a3fa926e24c6
>> config: i386-randconfig-m021-20210103 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         # =

>> https://github.com/0day-ci/linux/commit/7d8b8d7954012e210a5e6c77103e5238=
2c6b5503
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review =

>> Arnd-Bergmann/drm-msm-a6xx-add-CONFIG_QCOM_LLCC-dependency/20210103-2207=
04
>>         git checkout 7d8b8d7954012e210a5e6c77103e52382c6b5503
>>         # save the attached .config to linux build tree
>>         make W=3D1 ARCH=3Di386
>> =

>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> =

>> All errors (new ones prefixed by >>):
>> =

>> >> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>>    drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by =

>> DRM_MSM
>>    drivers/gpu/drm/msm/Kconfig:3: symbol DRM_MSM depends on =

>> QCOM_COMMAND_DB
>>    drivers/soc/qcom/Kconfig:19: symbol QCOM_COMMAND_DB depends on =

>> OF_RESERVED_MEM
>>    drivers/of/Kconfig:80: symbol OF_RESERVED_MEM default is visible =

>> depending on DMA_CMA
>>    kernel/dma/Kconfig:109: symbol DMA_CMA is selected by FB_HYPERV
>>    drivers/video/fbdev/Kconfig:2182: symbol FB_HYPERV depends on FB
>>    drivers/video/fbdev/Kconfig:12: symbol FB is selected by =

>> DRM_KMS_FB_HELPER
>>    drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on =

>> DRM_KMS_HELPER
>>    For a resolution refer to Documentation/kbuild/kconfig-language.rst
>>    subsection "Kconfig recursive dependency limitations"
> =

> Ah, this depends on another patch of mine that I have in my randconfig =

> tree, to
> replace the 'select FB' in DRM_KMS_FB_HELPER with 'depends on FB'.
> =

> Should I resend that patch, or would someone suggest a different fix =

> for
> the CONFIG_QCOM_LLCC dependency issue?
> =


Thanks, your patch looks good to me unless Rob has some other idea. Once =

the recursive
dependency thing is sorted,

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Thanks,
Sai

-- =

QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a =

member
of Code Aurora Forum, hosted by The Linux Foundation
--===============2476525038404813643==--

