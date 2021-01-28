Content-Type: multipart/mixed; boundary="===============1144281732308725030=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [char-misc:char-misc-testing 33/62] drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator has lower precedence than '|'; '|' will be evaluated first
Date: Thu, 28 Jan 2021 09:06:37 +0100
Message-ID: <YBJwjTi77iQWwD3s@kroah.com>
In-Reply-To: <202101281343.HHBfhVkw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1144281732308725030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 01:42:55PM +0800, kernel test robot wrote:
> vim +56 drivers/misc/bcm-vk/bcm_vk_msg.c
> =

>     52	=

>     53	static void set_q_num(struct vk_msg_blk *msg, u32 q_num)
>     54	{
>     55		msg->trans_id =3D (msg->trans_id & ~BCM_VK_MSG_Q_MASK) |
>   > 56			(q_num >=3D VK_MSGQ_PER_CHAN_MAX) ? VK_MSGQ_NUM_DEFAULT : q_num;

That is a pretty horrible chunk of code, Scott, can you make this a
"real" if statement please so that we can read it?  :)

thanks,

greg k-h
--===============1144281732308725030==--

