Content-Type: multipart/mixed; boundary="===============6459255339646148076=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hverkuil-media:tc358840 4/4] drivers/media/i2c/tc358840.c:2869:36: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
Date: Sat, 22 Feb 2020 20:49:24 +0800
Message-ID: <202002222020.Y3PNEM5l%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6459255339646148076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://linuxtv.org/hverkuil/media_tree.git tc358840
head:   54531afb55437b5dc44ce1bcf5f2e70889dc388d
commit: 54531afb55437b5dc44ce1bcf5f2e70889dc388d [4/4] tc358840: add HDCP s=
upport
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 54531afb55437b5dc44ce1bcf5f2e70889dc388d
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/media/i2c/tc358840.c:3079:41: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3079:41: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3079:41: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3080:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3080:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3080:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3085:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3085:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3085:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3108:40: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3108:40: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3108:40: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3109:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3109:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3109:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3114:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3114:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3114:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3115:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3115:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3115:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3120:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3120:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3120:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3121:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3121:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3121:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3126:46: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3126:46: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3126:46: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3127:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3127:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3127:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3133:45: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3133:45: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3133:45: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3134:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3134:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3134:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3140:45: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3140:45: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3140:45: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3141:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3141:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3141:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3147:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3147:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3147:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3148:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3148:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3148:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3153:44: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3153:44: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3153:44: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3154:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3154:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3154:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3160:44: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3160:44: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3160:44: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3161:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3161:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3161:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3167:43: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3167:43: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3167:43: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3168:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3168:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3168:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3173:38: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3173:38: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3173:38: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3174:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3174:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3174:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3179:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3179:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3179:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3180:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3180:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3180:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3185:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3185:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3185:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3186:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3186:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3186:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3191:39: sparse: sparse: incorrect type in =
argument 1 (different base types)
   drivers/media/i2c/tc358840.c:3191:39: sparse:    expected restricted __b=
e32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3191:39: sparse:    got unsigned int const =
[usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:3192:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types)
   drivers/media/i2c/tc358840.c:3192:9: sparse:    expected restricted __be=
32 const [usertype] *p
   drivers/media/i2c/tc358840.c:3192:9: sparse:    got unsigned int const [=
usertype] *[assigned] property
   drivers/media/i2c/tc358840.c:748:38: sparse: sparse: cast truncates bits=
 from constant value (ffff3fff becomes 3fff)
>> drivers/media/i2c/tc358840.c:2869:36: sparse: sparse: cast truncates bit=
s from constant value (ffffff7f becomes 7f)

vim +2869 drivers/media/i2c/tc358840.c

  2798	=

  2799	static int tc358840_s_ctrl(struct v4l2_ctrl *ctrl)
  2800	{
  2801		struct v4l2_subdev *sd =3D
  2802			&container_of(ctrl->handler, struct tc358840_state, hdl)->sd;
  2803		struct tc358840_state *state =3D to_state(sd);
  2804		int err =3D 0;
  2805	=

  2806		switch (ctrl->id) {
  2807		case V4L2_CID_TEST_PATTERN:
  2808			v4l2_dbg(2, debug, sd, "%s() id=3D0x%x old_val=3D%d new_val=3D%d:\=
n",
  2809				 __func__, ctrl->id, state->test_pattern, ctrl->val);
  2810			/* Not allowed to enable/disable testpat if streaming enabled */
  2811			if (state->enabled) {
  2812				if (!state->test_pattern ||
  2813				    ctrl->val =3D=3D TEST_PATTERN_DISABLED) {
  2814					err =3D -EBUSY;
  2815					break;
  2816				}
  2817			}
  2818			tc358840_set_test_pattern_type(sd, ctrl->val);
  2819	=

  2820			/* test pattern enabled ? set/override tx_5V to true */
  2821			if (!state->test_pattern && ctrl->val) {
  2822				__v4l2_ctrl_s_ctrl(state->detect_tx_5v_ctrl, true);
  2823				v4l2_subdev_notify_event(sd, &tc358840_ev_fmt);
  2824				tc358840_set_test_pattern_timing(sd, &state->timings);
  2825			}
  2826			/* test pattern disabled ? set tx_5V according to HW */
  2827			if (state->test_pattern && !ctrl->val) {
  2828				__v4l2_ctrl_s_ctrl(state->detect_tx_5v_ctrl,
  2829						   tx_5v_power_present(sd));
  2830				state->found_stable_signal =3D false;
  2831				v4l2_subdev_notify_event(sd, &tc358840_ev_fmt);
  2832			}
  2833	=

  2834			state->test_pattern =3D ctrl->val;
  2835			state->test_pattern_changed =3D true;
  2836			break;
  2837		case  V4L2_CID_DV_RX_RGB_RANGE:
  2838			state->rgb_quantization_range =3D ctrl->val;
  2839			if (state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_RGB888_1X24) {
  2840				mutex_lock(&state->lock);
  2841				set_rgb_quantization_range(sd);
  2842				mutex_unlock(&state->lock);
  2843			}
  2844			break;
  2845		case V4L2_CID_DV_HDCP_ENABLE:
  2846			v4l2_subdev_notify_event(sd, &tc358840_ev_fmt);
  2847			v4l2_info(sd, "event: %s HDCP\n",
  2848				  ctrl->val ? "enable" : "disable");
  2849			mutex_lock(&state->lock);
  2850			tc358840_disable_hpd(sd);
  2851			tc358840_set_hdmi_hdcp(sd, ctrl->val);
  2852			if (tx_5v_power_present(sd))
  2853				tc358840_enable_hpd(sd);
  2854			mutex_unlock(&state->lock);
  2855			break;
  2856		case V4L2_CID_DV_HDCP_MAXCASCADE_EXCEEDED:
  2857			v4l2_dbg(2, debug, sd, "%s: hdcp max cascade exceeded %s\n",
  2858				 __func__, ctrl->val ? "true" : "false");
  2859			i2c_wr8_and_or(sd,
  2860				       BSTATUS1,
  2861				       ~MASK_MAX_EXCED,
  2862				       ctrl->val ? MASK_MAX_EXCED : 0);
  2863			break;
  2864		case V4L2_CID_DV_HDCP_MAXDEVS_EXCEEDED:
  2865			v4l2_dbg(2, debug, sd, "%s: hdcp max devs exceeded %s\n",
  2866				 __func__, ctrl->val ? "true" : "false");
  2867			i2c_wr8_and_or(sd,
  2868				       BSTATUS0,
> 2869				       (u8)~MASK_MAX_DEVEXCED,
  2870				       ctrl->val ? MASK_MAX_DEVEXCED : 0);
  2871			break;
  2872		case V4L2_CID_DV_HDCP_DEPTH:
  2873			v4l2_dbg(2, debug, sd, "%s: hdcp depth %d\n",
  2874				 __func__, ctrl->val);
  2875			i2c_wr8_and_or(sd,
  2876				       BSTATUS1,
  2877				       ~MASK_CASCADE_DEPTH,
  2878				       ctrl->val & MASK_CASCADE_DEPTH);
  2879			break;
  2880		case V4L2_CID_DV_HDCP_DEVICE_COUNT:
  2881			v4l2_dbg(2, debug, sd, "%s: hdcp device count %d\n",
  2882				 __func__, ctrl->val);
  2883			i2c_wr8_and_or(sd,
  2884				       BSTATUS0,
  2885				       ~MASK_DEVICE_COUNT,
  2886				       ctrl->val & MASK_DEVICE_COUNT);
  2887			break;
  2888		case V4L2_CID_DV_HDCP_KSVFIFO: {
  2889			/* tc358840 supports up to 16 devices */
  2890			u8 ksvfifo[16][V4L2_DV_HDCP_KSV_SIZE];
  2891			size_t j;
  2892	=

  2893			memset(ksvfifo, 0, sizeof(ksvfifo));
  2894	=

  2895			for (j =3D 0; j < ctrl->elems / V4L2_DV_HDCP_KSV_SIZE; j++) {
  2896				/* big to little endian (HDCP 1.4) */
  2897				ksvfifo[j][0] =3D *(ctrl->p_new.p_u8
  2898					+ j * V4L2_DV_HDCP_KSV_SIZE + 4);
  2899				ksvfifo[j][1] =3D *(ctrl->p_new.p_u8
  2900					+ j * V4L2_DV_HDCP_KSV_SIZE + 3);
  2901				ksvfifo[j][2] =3D *(ctrl->p_new.p_u8
  2902					+ j * V4L2_DV_HDCP_KSV_SIZE + 2);
  2903				ksvfifo[j][3] =3D *(ctrl->p_new.p_u8
  2904					+ j * V4L2_DV_HDCP_KSV_SIZE + 1);
  2905				ksvfifo[j][4] =3D *(ctrl->p_new.p_u8
  2906					+ j * V4L2_DV_HDCP_KSV_SIZE);
  2907			}
  2908	=

  2909			v4l2_info(sd, "hdcp write ksvfifo\n");
  2910	=

  2911			i2c_wr(sd, KSVFIFO, (u8 *)ksvfifo, ctrl->elems);
  2912			break;
  2913		}
  2914		case V4L2_CID_DV_HDCP_REPEATER_READY:
  2915			v4l2_info(sd, "hdcp repeater ready\n");
  2916			state->hdcp_repeater_ready =3D true;
  2917			break;
  2918		case TC358840_CID_EQ_BYPS_MODE:
  2919			if (ctrl->val =3D=3D 0) {
  2920				state->invalid_eq_bypass[0] =3D false;
  2921				state->invalid_eq_bypass[1] =3D false;
  2922			}
  2923			break;
  2924		}
  2925		return err;
  2926	}
  2927	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6459255339646148076==--

