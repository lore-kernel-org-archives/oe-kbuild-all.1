Content-Type: multipart/mixed; boundary="===============1818526442359730178=="
MIME-Version: 1.0
From: Scott Branden <scott.branden@broadcom.com>
To: kbuild-all@lists.01.org
Subject: Re: [char-misc:char-misc-testing 33/62] drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator has lower precedence than '|'; '|' will be evaluated first
Date: Thu, 28 Jan 2021 16:35:20 -0800
Message-ID: <baec5e4c-e4c4-d53b-5ce9-e616a5abde76@broadcom.com>
In-Reply-To: <YBJwjTi77iQWwD3s@kroah.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1818526442359730178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2021-01-28 12:06 a.m., Greg Kroah-Hartman wrote:
> On Thu, Jan 28, 2021 at 01:42:55PM +0800, kernel test robot wrote:
>> vim +56 drivers/misc/bcm-vk/bcm_vk_msg.c
>>
>>     52	=

>>     53	static void set_q_num(struct vk_msg_blk *msg, u32 q_num)
>>     54	{
>>     55		msg->trans_id =3D (msg->trans_id & ~BCM_VK_MSG_Q_MASK) |
>>   > 56			(q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT : q_num;
> That is a pretty horrible chunk of code, Scott, can you make this a
> "real" if statement please so that we can read it?  :)
Changed to readable if statement and v10 patch series sent out.
Also fixed compile option if CONFIG_TTY is not set in series.
>
> thanks,
>
> greg k-h

--===============1818526442359730178==--

