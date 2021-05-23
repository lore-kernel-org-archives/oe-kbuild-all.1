Content-Type: multipart/mixed; boundary="===============7891130114781716885=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [ath6kl:pending 16/26] drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no previous prototype for 'wcn36xx_get_first_vif'
Date: Sun, 23 May 2021 20:32:40 +0300
Message-ID: <87im39gxtz.fsf@codeaurora.org>
In-Reply-To: <f4ed523d-b2c6-556f-b9a0-ae14b431645f@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7891130114781716885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

> On 23/05/2021 14:05, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pe=
nding
>> head:   a9cccebc0c3b91c2e5d2033d11def1e6f7fc74d4
>> commit: d1f965c7b4068af9420408f308bcc6206158b658 [16/26] wcn36xx:
>> Run suspend for the first ieee80211_vif
>> config: arc-allyesconfig (attached as .config)
>> compiler: arceb-elf-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          #
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=
=3Dd1f965c7b4068af9420408f308bcc6206158b658
>>          git remote add ath6kl
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>>          git fetch --no-tags ath6kl pending
>>          git checkout d1f965c7b4068af9420408f308bcc6206158b658
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Darc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no
>>> previous prototype for 'wcn36xx_get_first_vif'
>>> [-Wmissing-prototypes]
>>      1091 | struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *=
wcn)
>>           |                       ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/wcn36xx_get_first_vif +1091 drivers/net/wireless/ath/wcn36xx/main.c
>>
>>    1090	=

>>> 1091	struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *wcn)
>>    1092	{
>>    1093		struct wcn36xx_vif *tmp;
>>    1094		struct ieee80211_vif *vif =3D NULL;
>>    1095	=

>>    1096		list_for_each_entry(tmp, &wcn->vif_list, list) {
>>    1097			vif =3D wcn36xx_priv_to_vif(tmp);
>>    1098			if (vif)
>>    1099				break;
>>    1100		}
>>    1101		return vif;
>>    1102	}
>>    1103	=

>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>
> Hi Kalle.
>
> I'll issue a fix for both of these ASAP

Oops, your patches were not supposed to be in the pending branch yet as
I saw some conflicts. I suspect my patchwork script has a bug with
handling conflicts.

Also I haven't had a chance to review your patches yet. So it would be
better if you can wait for my review comments, and after I have updated
ath.git master branch you can rebase them.

-- =

https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
--===============7891130114781716885==--

